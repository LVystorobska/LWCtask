
import { LightningElement, track} from 'lwc';
import getMatchesList from '@salesforce/apex/lwcBackControl.getMatchesList';
const columnList = [
    {label: 'Name', fieldName: 'Name'},
    {label: 'Phone', fieldName: 'Phone'}
];
export default class DataRetriever extends LightningElement {
    @track dataSet;
    @track error;
    @track columnList = columnList;
    keyChanged(event) {
        const searchKey = event.target.value;
        getMatchesList({ searchKey }).then(result => {
            this.dataSet = result;
            this.error = undefined;
        }).catch(error => {
            this.error = error;
            this.dataSet = undefined;
        });
    }
}