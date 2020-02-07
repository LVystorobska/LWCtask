public with sharing class WrappedData {
@AuraEnabled
public String Name;
@AuraEnabled
public String Phone;

public WrappedData(Account accountInput){
        this.Name = accountInput.Name;
        this.Phone = accountInput.Phone;
    }

public WrappedData(Contact contactInput){
       this.Name = contactInput.Name;
       this.Phone = contactInput.Phone;
    }

public WrappedData(Lead leadInput){
       this.Name = leadInput.Name;
       this.Phone = leadInput.Phone;
    }

}


