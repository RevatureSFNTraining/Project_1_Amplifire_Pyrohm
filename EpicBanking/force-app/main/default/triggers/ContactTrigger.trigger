trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            
        }
        when BEFORE_UPDATE{
            
        }
        when BEFORE_DELETE{
           ContactTriggerHandler.preventContactDeletion(); 
        }
        when AFTER_INSERT{
            
        }
        when AFTER_UPDATE{
            
        }
        when AFTER_DELETE{
            
        }
        when AFTER_UNDELETE{
            
        }
        when else{
 
        }
    }
}