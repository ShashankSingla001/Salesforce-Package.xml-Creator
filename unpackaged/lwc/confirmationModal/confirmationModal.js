import { track, api, LightningElement } from 'lwc';

export default class ConfirmationModal extends LightningElement {
    @track
    showmodal = true;
    @api
    confirmationMessage;
    handleClick(evt) {
        let value = evt.target.label;
        let promptAction;
        if (value == 'Yes') {
            promptAction = new CustomEvent("promptaction", { detail: 'Yes' });
        } else {
            promptAction = new CustomEvent("promptaction", { detail: 'Cancel' });
        }
        this.dispatchEvent(promptAction);
        this.showmodal = false;
    }
}