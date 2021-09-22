public with sharing class transactionLU {

//controller containers for each object
    public List<Transaction__c> ctc{get;set;}
    public List<Employee__c> cec;
    public List<Contact> ccc;
//controller containers for selected record in VS page
    public Employee__c sec{get;set;}
    public Contact scc{get;set;}
    
    public transactionLU(){
        this.ctc= [select id, Name, Employee__c, Contact__c, Meal__c, Sale_Price__c, tip__c, tip_type__c, tip_amount__c from Transaction__c order by LastModifiedById];
        this.cec= [select id, Name from Employee__c order by Name];
        this.ccc= [select id, Name from contact order by Name];
        this.sec=cec.get(0);
        this.scc=ccc.get(0);
    }
    
    public List<Employee__c> getcec(){
        return cec;
    }
    
    public List<Contact> getccc(){
        return ccc;
    }
    
    public void save(){
        update ctc;
        return;
    }
    
    public void create(){
        Transaction__c n=new Transaction__c(Employee__c=sec.id,Contact__c=scc.id);
        n.Sale_Price__c=0;
        insert n;
        return;
    }
}