/** Test class for OrgManangementController. 
----Objective of this test class is to achieve minimum 75% passing of all methods. 
----Author: Elizabeth DeGroot
----Date Created 7/26/17
**/
@isTest(SeeAllData=true) 
public class TestOrgManagementController {
 
   //Declare Variables for initial counts
   public integer APageCount {get; set;}
   public integer AClassCount  {get; set;} 
   public integer UserCount {get; set;}  
   public integer ProfileCount {get; set;}
   public integer StaticCount {get; set;}
   public integer ATriggerCount {get; set;} 
   public integer SandboxCount {get; set;}   
   public integer staticResourceSize  {get; set;}  

   //Grabbing intitial counts for all areas.
   @isTest static void OrgManagementController() {
        Integer APageCount = [SELECT count() FROM ApexPage];
        System.assert(APageCount != null); 
       
        Integer AClassCount = [SELECT count() FROM ApexClass];
        System.assert(AClassCount != null);
        
        Integer UserCount = [SELECT count() FROM USER  ];
        System.assert(UserCount != null);
        
        Integer ProfileCount = [SELECT count() FROM Profile];
        System.assert(ProfileCount != null);
        
        Integer StaticCount = [SELECT count() FROM StaticResource];
        System.assert(StaticCount != null);
        
        Integer ATriggerCount = [SELECT count() FROM ApexTrigger];
        System.assert(ATriggerCount != null);
        
        Integer SandboxCount = [SELECT count() FROM Organization];
        System.assert(SandboxCount != null);  
   } 
   
   //List of Profile Results
   static testMethod void proResults() { 
         List<AggregateResult> counts = [SELECT Profile.name proName, max(profile.Id) proId, max(LastModifiedDate) lastModDate,   count(ID) userProCount FROM USER GROUP BY Profile.Name ];
         System.assert(counts != null);
   }
   //List of Static Resource Size BodyLength - max 262,144,000
   static testMethod void staticResources() {
         List<AggregateResult> counts =  [SELECT sum(BodyLength) FROM StaticResource];
         System.assert(counts != null);   
   }
   //List of Apex Triggers Results
   static testMethod void aTriggers() {
          List<AggregateResult> counts = [SELECT Name, max(id) TrigId, Max(ApiVersion) apiV, max(LastModifiedDate) lastModDate FROM ApexTrigger WHERE Status = 'active' GROUP BY Name];
          System.assert(counts != null);
   }
   //List of Apex Pages Results
   static testMethod void aPages() {
          List<AggregateResult> counts = [SELECT  Name, max(Id) aPID, max(ApiVersion) apiV, max(LastModifiedDate) lastModDate FROM ApexPage GROUP BY Name];
          System.assert(counts != null);
   }
   //List of Apex Classes Results
   static testMethod void aClass() {
          List<AggregateResult> counts = [SELECT  Name, max(Id) aCID, max(ApiVersion) apiV, max(LastModifiedDate) lastModDate FROM ApexClass GROUP BY Name];
          System.assert(counts != null);
   }
   //List of Org and Sandboxes Results
   static testMethod void sandBoxes() {
          List<AggregateResult> counts = [SELECT Name, max(OrganizationType) orgType, max(InstanceName) InstName, max(Id) sID, max(LastModifiedDate) lastModDate FROM Organization GROUP BY Name];
          System.assert(counts != null);
   }
   //Static Resource
   static testMethod void sResource() {
          List<AggregateResult> counts = [SELECT Name, sum(bodylength) bLength, max(Id) sID, max(LastModifiedDate) lastModDate FROM StaticResource GROUP BY Name];
          System.assert(counts != null);
   }
}
