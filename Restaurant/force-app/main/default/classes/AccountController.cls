public class AccountController {
    public Boolean hideTable { get; set; }
    public Boolean showTable { get; set; }
	public List<Account> accounts { get; set; }
    public string singleRecord { get; set; }
    public string selected { get; set; }
    public string link { get; set; }
    
    public AccountController() {
        this.accounts = [SELECT Id, Name FROM Account];
        this.hideTable = true;
        this.showTable = false;
    }
    
    public void getSingleRecord() {
        this.accounts = [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, Phone FROM Account WHERE Id=:this.singleRecord];
        this.hideTable = false;
        this.showTable = true;
        this.buildLink();
    }

    public Pagereference nextPage() {
        switch on selected {
            when 'CONTACT' {
                return Page.ContactPage;
            }
            when 'EMPLOYEE' {
                return Page.EmployeePage;
            }
            when 'MEAL' {
                return Page.Food;
            }
            when 'DISTRIBUTOR' {
                return Page.distributor;
            }
            when 'TRANSACTION' {
                return Page.Transactions_VF;
            }
            when else {
                return Page.AccountVFPage;
            }
        }
    }

    @TestVisible
    private void buildLink() {
        string linkString = 'https://www.google.com/maps/place/'+ this.accounts[0].BillingStreet + '+' + this.accounts[0].BillingCity + 
        '+' + this.accounts[0].BillingState + '+' + this.accounts[0].BillingPostalCode;
        this.link = linkString.replace(' ', '+');
    }

    public void goBack() {
        this.accounts = [SELECT Id, Name FROM Account];
        this.hideTable = true;
        this.showTable = false;
        this.singleRecord = NULL;
        this.selected = NULL;
        this.link = NULL;
    }
}