public with sharing class transactionLU {
    public List<Transaction__c> ctc{get;set;}
    public List<Employee__c> cec{get;}
    public List<Contact> ccc{get;}
    public Employee__c sec{get;set;}
    public Contact scc{get;set;}
    
    public transactionLU(){
        this.ctc= [select id, Name, Employee__c, Contact__c, Meal__c, Sale_Price__c, tip__c, tip_type__c, tip_amount__c from Transaction__c order by LastModifiedById];
    }
    
    public void save(){
        update ctc;
        return;
    }
}