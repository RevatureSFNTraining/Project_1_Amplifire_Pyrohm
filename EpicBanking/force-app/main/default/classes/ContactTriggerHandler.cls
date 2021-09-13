public with sharing class ContactTriggerHandler {
    public static void preventContactDeletion() {
        for(Contact con : (List<Contact>) Trigger.old) {
			if(con.AccountId == null) {
				con.addError('You cannot delete this contact. It is not associated with an existing account!');
			}
		}
    }
}