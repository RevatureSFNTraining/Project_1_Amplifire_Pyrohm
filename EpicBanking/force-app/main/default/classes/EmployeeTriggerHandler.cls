public with sharing class EmployeeTriggerHandler {
    public static void setEmployeeEmail() {
        //List<Employee__c> employeeList = new List<Employee__c>{};
        for(Employee__c emp : (List<Employee__c>) Trigger.new) {
            //[select Employee_ID__c from Employee__c];
            emp.Employee_Email__c = 'employee_' + emp.Name.substringAfter(' ') + '@banking.org';
            //employeeList.add(emp);
            //System.debug(emp.Employee_Email__c);
        }
        //insert employeeList;
        
        
    }
}