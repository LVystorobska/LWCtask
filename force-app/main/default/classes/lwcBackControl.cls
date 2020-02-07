public with sharing class lwcBackControl {
    @AuraEnabled
    public static List<Contact> getMatchesList(String searchKey) {
        String forSOSLquery = '\'' + searchKey + '*' + '\'';
        String fullQuery = 'FIND ' + forSOSLquery + ' IN ALL FIELDS RETURNING Contact(Id,Name)';
        List<List<sObject>> response = search.query(fullQuery);
        List<Contact>  contacts = ((List<Contact>) response[0]);
        System.debug(contacts);
        return contacts;
    }
}
