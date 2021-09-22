@isTest
private class AccountControllerTests {
    @TestSetup
    static void makeData() {
        List<Account> Accs = new List<Account>();
        for(Integer i = 0; i < 100; i++) {
            Account acc = new Account(Name='Account'+i, BillingStreet=i+'21234 Street Road', BillingCity='City'+i, BillingState='DE', 
                                      BillingPostalCode='17542', BillingCountry='USA', Phone='2344322345');
			Accs.add(acc);            
        }
        Database.insert(Accs, true);
        
    }
    
    
    @isTest static void testConstructor() {
        Test.startTest();
        AccountController AC = new AccountController();
        System.assert(AC.hideTable);
        System.assert(!(Ac.showTable));
        System.assertEquals(100, AC.accounts.size());
        Test.stopTest();
    }
    
    @isTest static void testGetSingleRecord() {
        Test.startTest();
        AccountController AC = new AccountController();
        AC.singleRecord = [SELECT Id FROM Account WHERE Name='Account1' LIMIT 1].Id;
        
        System.assert(AC.hideTable);
        System.assert(!(Ac.showTable));
        System.assertEquals(100, AC.accounts.size());
        System.assertEquals(NULL, AC.link);
        
        Ac.getSingleRecord();

        System.assert(!(Ac.hideTable));        
        System.assert(AC.showTable);
        System.assertEquals(1, AC.accounts.size());
        System.assertEquals('Account1', AC.accounts[0].Name);
        System.assertNotEquals(NULL, AC.link);
        Test.stopTest();
    }
    
    @isTest static void testNextPage() {
        Test.startTest();
        AccountController AC = new AccountController();
        System.assertEquals(NULL, AC.selected);
        System.assertEquals(Page.AccountVFPage.getURL(),AC.nextPage().getURL());
        
        AC.selected = 'CONTACT';
        System.assertEquals(Page.ContactPage.getURL(),AC.nextPage().getURL());
        
        AC.selected = 'EMPLOYEE';
        System.assertEquals(Page.EmployeePage.getURL(),AC.nextPage().getURL());
        
        AC.selected = 'MEAL';
        System.assertEquals(Page.Food.getURL(),AC.nextPage().getURL());
        
        AC.selected = 'DISTRIBUTOR';
        System.assertEquals(Page.distributor.getURL(),AC.nextPage().getURL());
        
        AC.selected = 'TRANSACTION';
        System.assertEquals(Page.Transactions_VF.getURL(),AC.nextPage().getURL());
        
        AC.selected = 'RANDOM STRING';
        System.assertEquals(Page.AccountVFPage.getURL(),AC.nextPage().getURL());
        Test.stopTest();
    }
    
    @isTest static void testBuildLink() {
        Test.startTest();
        AccountController AC = new AccountController();
        AC.singleRecord = [SELECT Id FROM Account WHERE Name='Account1' LIMIT 1].Id;
        System.assertEquals(NULL, AC.link);
        
        AC.getSingleRecord();
        System.assertNotEquals(NULL, AC.link);
        System.assertEquals('https://www.google.com/maps/place/121234+Street+Road+City1+DE+17542', AC.link);
        Test.stopTest();
    }
    
    @isTest static void testGoBack() {
        Test.startTest();
        AccountController AC = new AccountController();
        System.assertEquals(100,Ac.accounts.size());
        System.assert(AC.hideTable);
        System.assert(!AC.showTable);
        
        Ac.selected = 'CONTACT';
        AC.singleRecord = [SELECT Id FROM Account WHERE Name='Account1' LIMIT 1].Id;
        AC.getSingleRecord();
        
        System.assertEquals(1, AC.Accounts.size());
        System.assert(AC.showTable);
        System.assert(!AC.hideTable);
        
        AC.goBack();
        
        System.assertEquals(100, AC.Accounts.size());
        System.assert(AC.hideTable);
        System.assert(!AC.showTable);
        Test.stopTest();
    }
}