/* Author: Elizabeth DeGroot
     Date: Dec 2017
     Description: Update selected records and remove sensitive information, replaced with generic GDPR.
*/
public with sharing class CasesController {
   private ApexPages.StandardSetController standardController; 
   
   public CasesController(ApexPages.StandardSetController standardController){
      this.standardController = standardController;
   }
    
   //Declare variables
   public String message {get;set;}  
   String redactedValue = 'GDPR UPDATED';
   String redactedValueEmail = 'GDPRUPDATED@salesforce.com';
    
   //Update all fields with specific GDPR general data, but not save.
   public PageReference gdprUpdate(){ 
      List<Case> selectedCases = (List<Case>) standardController.getSelected();   
         for(Case selectedCase : selectedCases){ 
            selectedCase.user_id__c = redactedValue;
            selectedCase.orgid__c = redactedValue;
            selectedCase.user_name__c = redactedValue;
            selectedCase.user_email__c = redactedValueEmail;
            selectedCase.Content__c = redactedValue;
            selectedCase.GDPR_Compliant__c = true;  
         }
     return null;
   }   
    
   // 'save' method to push field update to records. 
   public PageReference saveCases(){ 
      return standardController.save();  
   }
    
   // 'cancel' method to go back a page and remove edits.     
   public PageReference cancelOps(){ 
      return standardController.cancel();
   } 
}
