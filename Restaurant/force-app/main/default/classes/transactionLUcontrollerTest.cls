@isTest
private class transactionLUcontrollerTest{

    @isTest
    static void SinglePositive(){
        employee__c dummye=new employee__c(Name='John', salary__c=0, Hired_On_Date__c=date.newinstance(2020, 1, 1));
        insert dummye;
        contact dummyc= new contact(lastname='doe');
        insert dummyc;
        
        transaction__c dummyt= new transaction__c(Employee__c=dummye.id,Contact__c=dummyc.id);
        dummyt.Sale_Price__c=0.00;

        transactionLU controller=new transactionLU();

        List<Transaction__c> testt=controller.ctc;
        List<Employee__c> teste=controller.getcec();
        List<Contact> testc=controller.getccc();
        string sse= controller.sec;
        string ssc= controller.scc;

        List<Transaction__c> aet= [select id, Name, Employee__c, Contact__c, Meal__c, Sale_Price__c from Transaction__c];
        List<Employee__c> aee= [select id, Name from Employee__c order by Name];
        List<Contact> aec= [select id, Name from contact order by Name];

        system.assertequals(testt, aet);
        system.assertequals(teste, aee);
        system.assertequals(testc, aec);
        system.assertequals(sse, dummye.id);
        system.assertequals(ssc, dummyc.id);
        
        
        system.assertequals(testt.size(), 0);
        
        controller.create();
        testt=controller.ctc;

        system.assertnotequals(testt.get(0), null);
        
        testt.get(0).Sale_Price__c=5;
        controller.save();
        testt=controller.ctc;
        
        system.assertequals(testt.get(0).Sale_Price__c, 5);
    }
}