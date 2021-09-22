public with sharing class transactionLU {

//controller containers for each object
    public List<Transaction__c> ctc{get;set;}
    public List<Employee__c> cec;
    public List<Contact> ccc;
//controller containers for selected record in VS page
    public string sec{get;set;}
    public string scc{get;set;}
    
    public transactionLU(){
        this.ctc= [select id, Name, Employee__c, Contact__c, Meal__c, Sale_Price__c from Transaction__c order by LastModifiedById];
        this.cec= [select id, Name from Employee__c order by Name];
        this.ccc= [select id, Name from contact order by Name];
        this.sec=cec.get(0).id;
        this.scc=ccc.get(0).id;
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
        Transaction__c n=new Transaction__c(Employee__c=sec,Contact__c=scc);
        n.Sale_Price__c=0;
        insert n;
        this.ctc= [select id, Name, Employee__c, Contact__c, Meal__c, Sale_Price__c from Transaction__c order by LastModifiedById];
        return;
    }
}