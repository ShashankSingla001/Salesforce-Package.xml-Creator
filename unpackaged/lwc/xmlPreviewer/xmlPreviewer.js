import { LightningElement, track, wire } from 'lwc';
import {
    subscribe, APPLICATION_SCOPE, MessageContext
} from 'lightning/messageService';
import xmlViewChannel from '@salesforce/messageChannel/xmlviewer__c';

export default class XmlPreviewer extends LightningElement {
    subscription = null;
    @track xmlText = '';
    showCopyIcon = true;
    // Initialize  messageContext for Message Service
    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeXmlPreview();
    }
    /*this is just to let you know something needs to be selected First */
    get XmlFetcher() {
        return this.xmlText != undefined && this.xmlText != '' ? this.xmlText : 'No Components Selected Yet !!';
    }
    /*Atleast select some componets before Exporting,There must be some hack to download the basic structure right? */
    get disableExport() {
        return this.xmlText.length == 0;
    }
    /* The Message Channel when published will be subscribed here and the contents will be used to showcase xml */
    subscribeXmlPreview() {
        this.subscription = subscribe(
            this.messageContext,
            xmlViewChannel,
            (message) => {
                if (message.xmlList.length > 0) {
                    let currentPackage = this.xmlCreator(message.xmlList, message.versionId);
                    currentPackage = currentPackage.replace(/></gi, '>\n<');
                    currentPackage = currentPackage.replace(/<name>/gi, '      <name>')
                        .replace(/<members>/gi, '      <members>').replace(/<types>/gi, '  <types>')
                        .replace(/<\/types>/gi, '  <\/types>').replace(/<version>/gi, '  <version>');
                    this.xmlText = currentPackage;
                } else {
                    this.xmlText = '';
                }
            },
            { scope: APPLICATION_SCOPE }
        );
    }
    /* xmlCreator will simultaneously create the Epected XML  */
    xmlCreator(xmlList, versionId) {
        if (document.implementation.createDocument &&
            document.implementation.createDocumentType) {
            var doc = document.implementation.createDocument("", "", null);
            var pi = doc.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"');
            doc.insertBefore(pi, doc.firstChild);
            let packageElement = doc.createElement("Package");
            packageElement.setAttribute("xmlns", "http://soap.sforce.com/2006/04/metadata");
            for (let val of xmlList) {
                let peopleElem = doc.createElement('types');
                for (let cmps of val.components) {
                    let innerNode = doc.createElement("members");
                    let innervalue = doc.createTextNode(cmps);
                    innerNode.appendChild(innervalue);
                    peopleElem.appendChild(innerNode);
                }
                let nameElement = doc.createElement("name");
                let value = doc.createTextNode(val.obj);
                nameElement.appendChild(value);
                peopleElem.appendChild(nameElement);
                packageElement.appendChild(peopleElem);
            }
            let verElement = doc.createElement("version");
            let versionNode = doc.createTextNode(versionId);
            verElement.appendChild(versionNode);
            packageElement.appendChild(verElement);
            doc.appendChild(packageElement);
            let finalDoc;
            if (typeof XMLSerializer === "function") {
                var x = new XMLSerializer();
                finalDoc = x.serializeToString(doc);
            } else {
                finalDoc = doc.xml;
            }
            console.log('doc' + finalDoc);
            return finalDoc;
        } else {
            alert("Your browser does not support this example");
        }
    }
    /*this function will blindly copy whatever things you must have selected */
    handleCopyXml() {
        this.showCopyIcon = false;
        const el = document.createElement('textarea');
        el.value = this.xmlText;
        el.setAttribute('readonly', '');
        el.style.position = 'absolute';
        el.style.left = '-9999px';
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        let timeoutRef = setTimeout(() => {
            if (this.showCopyIcon == false) {
                this.showCopyIcon = true;
            } else {
                clearInterval(timeoutRef);
            }

        }, 100);
    }
    /* this is the Part we all are waiting for,just export and let Your Deployment Started  */
    exportPackage() {
        if (this.xmlText != undefined && this.xmlText.length > 0) {
            let downloadElement = document.createElement('a');
            downloadElement.href = 'data:text/xml;charset=utf-8,' + encodeURI(this.xmlText);
            downloadElement.target = '_self';
            downloadElement.download = 'Package.xml';
            document.body.appendChild(downloadElement);
            downloadElement.click();
        }
    }
}