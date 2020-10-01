import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import xmlViewChannel from '@salesforce/messageChannel/xmlviewer__c';
import { publish } from 'lightning/messageService';

export const helper = {
    /* This ViewOptions will be set initially and when Metadata Is being Refreshed */
    setViewOptions(cmp, options) {
        let components = cmp.viewOptions;
        options.forEach(item => {
            if (components.findIndex(val => val.value == item) == -1) {
                components.push({ 'label': item, 'value': item, 'checked': false, 'partial': false });
            }
        })
        return components;
    },
    /*Sorting is Important, Based on label itself */
    wrenchsortarraydata(getarray, sortingdirection, sortColumn) {
        getarray.sort(function (a, b) {
            var x = a[sortColumn] ? a[sortColumn].toLowerCase() : '', y = b[sortColumn] ? b[sortColumn].toLowerCase() : '';
            if (sortingdirection == 'ASC') {
                if (x > y) return 1;
                if (x < y) return -1;
                return 0;
            } else {
                if (x < y) return 1;
                if (x > y) return -1;
                return 0;
            }
        });
        return getarray;
    },
    /* handlePreviewXml will make sure that the xml structure should have salesforce specific Members,Names Pre Set  */
    handlePreviewXml(cmp) {
        let noStarAllowed = ['Report', 'CustomObject', 'Document', 'EmailTemplate', 'RecordType',
            'CustomField', 'ValidationRule', 'Dashboard', 'CustomLabel', 'CanvasMetadata', 'Letterhead', 'IframeWhiteListUrlSettings',
            'EmailServicesFunction', 'UIObjectRelationConfig', 'RemoteSiteSetting', 'NotificationTypeConfig', 'ManagedContentType',
            'ApexEmailNotifications', 'ListView', 'WorkflowTask', 'WorkflowRule', 'WorkflowFieldUpdate', 'WorkflowAlert', 'WebLink',
            'SharingOwnerRule', 'SharingReason', 'SharingCriteriaRule', 'MatchingRule', 'BusinessProcess', 'EscalationRules', 'UserCriteria'];
        let xmlList = [];
        let xmds = [];
        let options = cmp.options.filter(item => item.checked == true);
        options.forEach(value => {
            if (value.metaName == 'WaveDashboard') {
                xmds.push(value.apiName);
            }
            let index = xmlList.findIndex(val => val.obj == value.metaName);
            if (index > -1) {
                let currentList = xmlList[index].components;
                currentList.push(value.apiName);
                xmlList[index].components = currentList;
            } else {
                xmlList.push({ obj: value.metaName, components: [value.apiName] });
            }
        });
        xmlList.forEach(item => {
            let obj = cmp.viewOptions.filter(val => val.value == item.obj)[0];
            if (obj.checked == true && !noStarAllowed.includes(obj.value)) {
                item.components = ['*'];
            }
        });
        if (xmds.length > 0) {
            let index = xmlList.findIndex(val => val.obj == 'WaveXmd');
            if (index > -1) {
                xmlList[index].components = [...xmlList[index].components, ...xmds];
            } else {
                xmlList.push({ obj: 'WaveXmd', components: xmds });
            }
        }
        xmlList = this.wrenchsortarraydata(xmlList, 'ASC', 'obj');
        const payload = { xmlList: xmlList, versionId: cmp.versionId };
        publish(cmp.messageContext, xmlViewChannel, payload);
    },
    showToast(cmp, title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        cmp.dispatchEvent(event);
    }
}