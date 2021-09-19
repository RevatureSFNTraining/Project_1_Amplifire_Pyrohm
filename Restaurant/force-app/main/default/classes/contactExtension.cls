public class contactExtension {
    
    public boolean showCustOfWeek{get;set;} 
    public Contact mycon {get; set;}
    
	public contactExtension(ApexPages.StandardSetController stdController ) {
        mycon = [Select FirstName, LastName, Picture_URL__c, Transactions__c, Gender__c from Contact order by Transactions__c Desc limit 1][0];
        showCustOfWeek = false;
    }
    
    public void CustOFWeek(){
        showCustOfWeek = !showCustOfWeek;

    }
}