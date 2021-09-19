public class transactionLU {
    public string textInput{get;set;}
  	public string textOutput{get;set;}
    
    public List<Transaction__c> getTransaction(){
        List<Transaction__c> ret=[select Id, Contact__c, Employee__c, Meal__c, Sale_Price__c from Transaction__c];
        return ret;
    }
    public List<Employee__c> getEmployee(){
        List<Employee__c> ret=[select id, Name from Employee__c];
        return ret;
    }
    
    public List<Contact> getContact(){
        List<contact> ret=[select id, Name from Contact];
        return ret;
    }
}