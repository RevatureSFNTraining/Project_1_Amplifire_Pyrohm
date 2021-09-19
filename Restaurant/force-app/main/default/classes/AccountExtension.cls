public class AccountExtension {
    public List<Account> accs;
    public AccountExtension(ApexPages.StandardSetController controller) {
        this.accs = (List<Account>)controller.getRecords();
    }
}