public with sharing class transactionLU {
    public string textInput{get;set;}
    public string textOutput{get;set;}
    
    public List<Transaction__c> ctc{get;set;}
    
    public transactionLU(){
        this.ctc= [select id, Name, Employee__c, Contact__c, Meal__c, Sale_Price__c, tip__c, tip_type__c, tip_amount__c from Transaction__c order by LastModifiedById];
    }
    
    public void save(){
        update ctc;
        return;
    }
    
    public List<Employee__c> getEmployee(){
        List<Employee__c> ret=[select id, Name from Employee__c order by Name];
        return ret;
    }
    
    public List<Contact> getContact(){
        List<contact> ret=[select id, Name from Contact order by Name];
        return ret;
    }
}