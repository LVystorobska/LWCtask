
import { LightningElement, track} from 'lwc';
import getMatchesList from '@salesforce/apex/lwcBackControl.getMatchesList';
const columnList = [
    {label: 'Id', fieldName: 'Id'},
    {label: 'Name', fieldName: 'Name'}
];
    export default class DataRetriever extends LightningElement {
        @track contacts;
        @track error;
        @track columnList = columnList;
        keyChanged(event) {
            window.clearTimeout(this.delayTimeout);
            const searchKey = event.target.value;
            // eslint-disable-next-line @lwc/lwc/no-async-operation
            this.delayTimeout = setTimeout(() => {
            getMatchesList({ searchKey }).then(result => {
                this.contacts = result;
                this.error = undefined;
            }).catch(error => {
                this.error = error;
                this.contacts = undefined;
            });
        }, 350);
    }
}