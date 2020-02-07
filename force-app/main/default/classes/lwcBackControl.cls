public with sharing class lwcBackControl {
    @AuraEnabled
    public static List<WrappedData> getMatchesList(String searchKey) {
        String forSOSLquery = '\'' + searchKey + '*' + '\'';
        String fullQuery = 'FIND ' + forSOSLquery + ' IN ALL FIELDS RETURNING Account(Name, Phone), Contact(Name, Phone), Lead(Name, Phone)';
        List<List<sObject>> response = search.query(fullQuery);
        List<Account>  accounts = ((List<Account>) response[0]);
        List<Contact>  contacts = ((List<Contact>) response[1]);
        List<Lead>  leads = ((List<Lead>) response[2]);
        List<WrappedData> responseList = new List<WrappedData>();
        for(Account acc: accounts){
            WrappedData wrappedItem = new WrappedData(acc);
            responseList.add(wrappedItem);
        }
        for(Contact cont: contacts){
            WrappedData wrappedItem = new WrappedData(cont);
            responseList.add(wrappedItem);
        }
        for(Lead leed: leads){
            WrappedData wrappedItem = new WrappedData(leed);
            responseList.add(wrappedItem);
        }

        return responseList;
    }
}
