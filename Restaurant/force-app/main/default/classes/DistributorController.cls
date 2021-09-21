public with sharing class DistributorController {
    public List<Distributor__c> getDistributors(){
        List<Distributor__c> ret = [SELECT id, Name FROM Distributor__c];
        return ret;
    }
}