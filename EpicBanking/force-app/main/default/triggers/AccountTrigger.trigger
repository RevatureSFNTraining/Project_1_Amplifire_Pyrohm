trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            AccountTriggerHandler.avoidDuplicate();
        }
        when BEFORE_UPDATE{
            AccountTriggerHandler.avoidDuplicate();
        }
        when BEFORE_DELETE{

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