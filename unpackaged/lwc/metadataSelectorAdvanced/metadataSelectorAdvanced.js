/*
metadataSelectorAdvanced : Things to Know to understand Code
"Metadata Items" in the comments refer to All the Metadata Present In the configured Org (like. ApexClass,CustomLabel)
viewOptions[] will hold "Metadata Items"
"Metadata Components" in the comments refer to All the Metadata Component specific to a Metadata Item Present (like. All Apex Classes of Metadata ApexClass)
options[] will hold these "Metadata Components" 
*/

import { api, LightningElement, track, wire } from 'lwc';
import metadatafetcher from '@salesforce/apex/MetadataFetcherAdvanced.SearchObjects';
import getInitComponents from '@salesforce/apex/MetadataFetcherAdvanced.getComponents';
import partialCheckbox from '@salesforce/resourceUrl/MetadataCheckbox';
import { helper } from './metadataSelectorAdvancedHelper.js';
import { MessageContext } from 'lightning/messageService';

const columns = [
    { label: 'label', fieldName: 'value' }
]
export default class MetadataSelectorAdvanced extends LightningElement {
    @api
    versionId = '49.0';
    @track
    options = [];
    @track
    viewOptions = [];
    partialCheckboxIcon = partialCheckbox;
    columns = columns;
    optionFilter = '';
    chainingList = [];
    metaFilter = '';
    showComp = true;
    xmlList = [];
    isLoading = false;
    currentView;
    alreadyQueried;
    availableList = [];
    objselected = '';
    showPrompt = false;
    promptMode;
    confirmationMessage;

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.init();
    }
    toggleLoading() {
        this.isLoading = !this.isLoading;
    }
    /* init() will fetch the All the Metadata Items Present in the Configured Org On Load */
    init() {
        this.toggleLoading();
        getInitComponents()
            .then(result => {
                console.log('result' + JSON.stringify(result));
                if (result.components.length > 0) {
                    this.viewOptions = helper.setViewOptions(this, result.components);
                    this.alreadyQueried = [];
                    this.metaFilter = '';
                    this.optionFilter = '';
                }
                this.toggleLoading();
            }).catch(error => {
                this.error = error;
                helper.showToast(this, error, 'Error!', 'error')
                this.toggleLoading();
            });

    }
    /* Server Call to fetch the Metadata Components Related to any Specific Metadata
    being Present in CurrentView passed on as metaType */
    getMetadata(chainingEnabled, metaType) {

        this.toggleLoading();
        metadatafetcher({
            cmptype: metaType
        }).then(result => {
            console.log('result' + JSON.stringify(result));
            if (result.metaList.length > 0) {
                this.dataprocessor(JSON.parse(JSON.stringify(result.metaList)));
            }
            this.alreadyQueried.push(metaType);
            this.toggleLoading();
            if (chainingEnabled) {
                this.chainingList.shift();
                if (this.chainingList.length > 0) {
                    this.currentView = this.chainingList[0].value;
                    this.getMetadata(true, this.currentView);
                }
            }
        }).catch(error => {
            this.error = error;
            helper.showToast(this, error, 'Error!', 'error')
            this.toggleLoading();
        });

    }
    /* okay we need to process the data just to keep it clean. it will sort/check/uncheck/update the xml all together */
    dataprocessor(response) {
        let allmetaData = response;
        let availableList = allmetaData.filter(newVal => {
            return this.availableList.findIndex(existing => existing.value == newVal.cmptype + ':' + newVal.value) == -1;
        }).map(item => {
            return {
                label: item.label,
                value: item.cmptype + ':' + item.value,
                apiName: item.value,
                objName: item.objName,
                metaName: item.cmptype,
                checked: false
            }
        });
        this.availableList = [...this.availableList, ...availableList];
        this.options = this.getViewFields();
        helper.handlePreviewXml(this);
    }
    /* If Select All Metadata is being Clicked then it will make sure you don't fetch any already fetched components to 
    save some Server Calls.*/
    processAll() {
        this.chainingList = this.viewOptions.filter(item => !this.alreadyQueried.includes(item.value));
        if (this.chainingList.length > 0) {
            this.currentView = this.chainingList[0].value;
            this.getMetadata(true, this.currentView);
        }

    }
    /* To Enable/Disable Select All Metadata Button-icon  */
    get allMetaChecked() {
        return this.isLoading || this.viewOptions.length == 0 || this.viewOptions.findIndex(val => val.checked == false) == -1;
    }
    /* To Enable/Disable Clear All Metadata Button-icon  */
    get allMetaUnChecked() {
        return this.isLoading || this.viewOptions.length == 0 || this.viewOptions.findIndex(val => val.checked == true || val.partial ==true) == -1;
    }

    /*if already loading is happening then to avoid ambiguity */
    get disablerefreshMetadata() {
        return this.isLoading;
    }
    /* To Enable/Disable Select All Components Button-icon  */
    get allCompChecked() {
        return this.options.length == 0 || this.options.findIndex(val => val.metaName == this.currentView && val.checked == false) == -1;
    }
    /* To Enable/Disable Clear All Selected Components Button-icon  */
    get allCompUnChecked() {
        return this.options.length == 0 || this.options.findIndex(val => val.metaName == this.currentView && val.checked == true) == -1;
    }
    /* To Enable/Disable Search Input if any metadata Components are not present  */
    get disableCompSearch() {
        return this.options.filter(item => item.metaName == this.currentView).length == 0 ? true : false;
    }
    /* To Enable/Disable Search Input if any Metadata is not present in the org. This should not happend ideally  */
    get disableMetaSearch() {
        return this.viewOptions.length == 0 ? true : false;
    }
    /*Informative Part on the component search Input */
    get placeHolder() {
        return this.currentView != undefined && this.currentView != '' ? "Filter " + this.currentView : '';
    }
    /* to filter out Metadata Items*/
    get searchedmetaOptions() {
        if (this.metaFilter == '') {
            return this.viewOptions;
        } else {
            return this.viewOptions.filter(
                item => item.value.toLowerCase().includes(this.metaFilter.toLowerCase()) ||
                    item.label.toLowerCase().includes(this.metaFilter.toLowerCase()));
        }
    }
    /* you always want to see results based on selected Metadata so to make sure it works. */
    get freshoptions() {
        return this.filterOptions();
    }
    /* This function will always give results based on currentView and optionFilter values If any, being Set from searchAction(e) */
    filterOptions() {
        let options = this.options.filter(val => val.metaName == this.currentView);
        try {
            if (this.optionFilter != '') {
                if (this.optionFilter.includes(',')) {
                    let multiSearchValues = this.optionFilter.trim().split(',');
                    let shortListOptions = [];
                    multiSearchValues.forEach(item => {
                        if (item != '') {
                            let tempOptions = options.filter(opt =>
                                (opt.value.toLowerCase().includes(item.trim().toLowerCase())
                                    || opt.label.toLowerCase().includes(item.trim().toLowerCase()))
                            );
                            shortListOptions = [...shortListOptions, ...tempOptions];
                        }
                    });
                    options = shortListOptions.filter((v, i, a) => a.findIndex(t => (t.value === v.value)) === i);
                } else {
                    options = options.filter(item => item.value.toLowerCase().includes(this.optionFilter.trim().toLowerCase()) ||
                        item.label.toLowerCase().includes(this.optionFilter.trim().toLowerCase()));
                }
            }
        } catch (err) {
            helper.showToast(this, err.message, 'Error!', 'error')
        }
        return options;
    }
    /* works for both metadata Searh and Metadata Item Search Set the Filters Accordingly */
    searchAction(e) {
        this.toggleLoading();
        let searchType = e.target.dataset.id;
        if (searchType == 'metadata') {
            this.metaFilter = e.detail.value;
        } else {
            this.optionFilter = e.detail.value;
            this.partialCheck();
        }
        this.toggleLoading();

    }
    /* Very Crucial function for getting All the components selected/unselected once response comes from apex and sort too. */
    getViewFields() {
        let views = this.viewOptions.filter(val => val.checked == true).map(meta => { return meta.value });
        this.availableList.forEach(
            item => {
                if (views.includes(item.metaName)) {
                    item.checked = true;
                }
            });
        return helper.wrenchsortarraydata(this.availableList, 'ASC', 'label');
    }
    /*
    It will work when any Component related to a specific Metadata is selcted/unselected.
    it will update the xml alongside.
     */
    handleCompSelect(evt) {
        let compValue = evt.target.dataset.id;
        this.options.forEach(item => {
            if (item.value == compValue && item.metaName == this.currentView) {
                item.checked = evt.target.checked;
            }
        })
        this.partialCheck();
        helper.handlePreviewXml(this);
    }
    partialCheck() {
        this.toggleLoading();
        let optionsAll = this.options.filter(item => item.metaName == this.currentView);
        let allOptionCheckedLength = optionsAll.filter(item => item.checked == true);
        this.viewOptions.forEach(val => {
            if (val.value == this.currentView) {
                if (allOptionCheckedLength.length == 0) {
                    val.checked = false;
                    val.partial = false;
                }
                else if (allOptionCheckedLength.length == optionsAll.length) {
                    val.checked = true;
                    val.partial = false;
                } else if (allOptionCheckedLength.length > 0) {
                    val.checked = false;
                    val.partial = true;
                }
            }
        });
        this.toggleLoading();
    }
    /*
    It will work when any Metadata either through checbox or is being selected
     */
    handlemetaSelect(evt) {
        let val = false;
        this.toggleLoading();
        this.optionFilter = '';
        if (evt.target.type == 'checkbox') {
            this.currentView = evt.target.dataset.id;
            val = evt.target.checked;
            this.viewOptions.forEach(item => {
                if (item.value == evt.target.dataset.id)
                    item.checked = evt.target.checked;
            })
        } else {
            this.currentView = evt.currentTarget.id.split('-')[0].trim();
            val = true;
        } if (val) {
            if (!this.alreadyQueried.includes(this.currentView)) {
                this.getMetadata(false, this.currentView);
            } else if (evt.target.type == 'checkbox') {
                this.options.forEach(item => {
                    if (item.metaName == this.currentView) {
                        item.checked = true;
                    }
                });
            }
        } else {
            this.options.forEach(val => {
                if (val.metaName == this.currentView) {
                    val.checked = false;
                }
            });
        }
        helper.handlePreviewXml(this);
        this.toggleLoading();
    }
    /*it will work for multiple scenarios
    selectMeta: when you select all metadata items.
    selectComp: when you select all components related to specific Metadata 
    clearComp: When you unselect all components related to a specific metadata
    clearMeta: when you unselect all metadata items.
    RefreshMetadata: when you want to refresh the metadata components let's suppose a new apex class is added.
    */
    handleActions(e) {
        try {
            let buttonActionName = e.target.value;
            this.toggleLoading();
            if (buttonActionName == 'selectMeta') {
                this.showPromptModal('Fetch All', 'Are you Sure that you want to fetch All the Metadata Components?, Doing so might consume some Limits.Please Make sure you are ok with it!!');
            }
            else if (buttonActionName == 'RefreshMetadata') {
                this.showPromptModal('Refresh All', 'Are you Sure You want to Refresh All Metadata Indices ?');
            }
            else if (buttonActionName == 'selectComp') {
                let options = this.filterOptions();
                if (this.options.length > 0) {
                    this.options.forEach(item => {
                        if (item.metaName == this.currentView
                            && options.findIndex(val => val.value == item.value) > -1) {
                            item.checked = true;
                        }
                    });
                }
                this.partialCheck();
            }
            else if (buttonActionName == 'clearMeta' || buttonActionName == 'clearComp') {

                let options = buttonActionName == 'clearMeta' ? this.options : this.filterOptions();
                if (this.options.length > 0) {
                    this.options.forEach(item => {
                        if ((buttonActionName == 'clearMeta' || item.metaName == this.currentView)
                            && options.findIndex(val => val.value == item.value) > -1) {
                            item.checked = false;
                        }
                    });
                }
                if (buttonActionName == 'clearComp') {
                    this.partialCheck();
                } else {
                    this.viewOptions.forEach(item => {
                        item.checked = false;
                        item.partial = false;
                    });
                }
            }
            helper.handlePreviewXml(this);
            this.toggleLoading();
        } catch (err) {
            helper.showToast(this, err.message, 'Error!', 'error')
            this.toggleLoading();
        }
    }
    selectAllMetaOperations() {
        this.toggleLoading();
        this.viewOptions.forEach(item => {
            item.checked = true;
            item.partial = false;
        });
        if (this.options.length > 0) {
            this.options.forEach(item => {
                item.checked = true;
            });
        }
        this.processAll();
        helper.handlePreviewXml(this);
        this.toggleLoading();


    }
    /* Ex. if out of all Apex Class you selected few of them then partial Selcted Icon will Appear on metadata, when selected
    it will select all Apex Class so for handling that action. Here We Go.. */
    handlePartialClick(evt) {
        this.toggleLoading();
        let sel = evt.currentTarget.id.split('-')[0].trim();
        this.viewOptions.forEach(item => {
            if (item.value == sel) {
                item.checked = true;
                item.partial = false;
            }
        });
        if (!this.alreadyQueried.includes(this.currentView)) {
            this.getMetadata(false, this.currentView);
        } else {
            this.options.forEach(val => {
                if (val.metaName == this.currentView) {
                    val.checked = true;
                }
            });
        }
        this.currentView = sel;
        helper.handlePreviewXml(this);
        this.toggleLoading();
    }
    showPromptModal(promptMode, msg) {
        this.promptMode = promptMode;
        this.confirmationMessage = msg;
        this.showPrompt = true;
    }
    /* to make sure that some API  Consuming operations are performed with Intimation */
    handlePromptResponse(evt) {
        if (evt.detail == 'Yes') {
            if (this.promptMode == 'Fetch All') {
                this.selectAllMetaOperations();
            } else if (this.promptMode == 'Refresh All') {
                this.init();
            }
        }
        this.showPrompt = false;
        this.confirmationMessage = '';
        this.promptMode = '';
    }
}