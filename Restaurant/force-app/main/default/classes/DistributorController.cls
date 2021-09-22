global class DistributorController {
    
    public String csvParam {get; set;}
    public String csvResult {get; set;}
    
    public List<Distributor__c> getDistributors(){
        List<Distributor__c> ret = [SELECT id, Name FROM Distributor__c];
        return ret;
    }
    
    public void csvFactory(){
        csvResult = '';
        System.debug(csvParam);
        Distributor__c d = Database.query('SELECT id, Name, (SELECT id, Name, Is_Active__c, Account__c, Cost__c, Product_Count__c FROM Distribution_Contracts__r) FROM Distributor__c WHERE id = :csvParam LIMIT 1');
        
        
        //List<Distribution_Contract__c> dcs = new List<Distribution_Contract__c>();
        
        List<Distribution_Contract__c> dcs = d.Distribution_Contracts__r;
        
        //for(Distribution_Contract__c dc: d.Distribution_Contract__r){ 
        //    dcs.add(dc);
        //}
        
        
        String row = '';
        String csv = '';
        
        for(Distribution_Contract__c dc: dcs){
            row = dc.id;
            row = row + ', ' + dc.Account__c;
            row = row + ', ' + d.Name;
            row = row + ', ' + dc.Name;
            row = row + ', ' + dc.Product_Count__c;
            row = row + ', ' + dc.Cost__c;
            row = row + ', ' + dc.Is_Active__c;
            csvResult = csvResult + row + '<br>';
        }  
    }
}

/* 
public with sharing class DistributorController {
    public List<Distributor__c> getDistributors(){
        List<Distributor__c> ret = [SELECT id, Name FROM Distributor__c];
        return ret;
    }
}
*/