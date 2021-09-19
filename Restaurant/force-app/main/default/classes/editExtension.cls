public class editExtension {
	Contact con;
    private ApexPages.StandardController controller;
    
    public editExtension(ApexPages.StandardController controller) {
        this.controller = controller;
    }
    
    public PageReference save(){
        controller.save();
        PageReference returnPage = Page.ContactPage;
        returnPage.setRedirect(true);
        return returnPage;
    }
}