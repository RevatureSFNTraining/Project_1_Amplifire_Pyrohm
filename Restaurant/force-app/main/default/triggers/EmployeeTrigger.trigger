trigger EmployeeTrigger on Employee__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.OperationType {
        when BEFORE_INSERT {

        }
        when BEFORE_UPDATE {
            //EmployeeTriggerHandler.checkIfPastEmployee(Trigger.old, Trigger.newMap);
        }
        when BEFORE_DELETE {

        }
        when AFTER_INSERT {

        }
        when AFTER_UPDATE {

        }
        when AFTER_DELETE {

        }
        when AFTER_UNDELETE {

        }
        when else {

        }
    }
}