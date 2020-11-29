//Author: Elizabeth DeGroot
//Date: Feb 2018
//Description: Unit test for CollaborationGroupMember trigger to preven user from leaving 
//group only if they are standard user. This test specifically tests adding user to group if
//they arent already a member, and attempting to remove user. Only users with CollaborationRole
//'Admin' should be allowed to leave.

@isTest
public class PreventUserLeavingMandatoryGrpTest {
   
   @istest
   public static void mandatoryGroup(){
   
      //Start Test
      Test.startTest();
        
       
      //Declaring variables and pulling in the Id's of the profiles named  
      Profile standardProfile=[SELECT id
                               FROM Profile
                               WHERE name='Standard User' LIMIT 1]; 
      String userTestName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
      
      //Define and creates a new user
      User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
      EmailEncodingKey='UTF-8', LastName='Test', LanguageLocaleKey='en_US',
      LocaleSidKey='en_US', ProfileId = standardProfile.Id,
      TimeZoneSidKey='America/Los_Angeles',
      UserName=userTestName); 
      System.assertEquals('standarduser@testorg.com', u.email);
      
      //Inserts new user has 'Standard User' profile
      if (u.ProfileId == standardProfile.Id){
         insert u; 
           
         //Ensuring new user created has been system assigned 'Standard User' profile
         System.debug('User created successfully: ' + UserInfo.getProfileId()); 
         System.assertEquals(standardProfile.Id, u.ProfileId);
      }
           
      // Create collaboration group
      CollaborationGroup colGroup = new CollaborationGroup(
      Name = 'Q3-AdminSupport',  
      CollaborationType = 'Public',
      CanHaveGuests = false,
      IsArchived = false,
      IsAutoArchiveDisabled = false
      );
       
      //Inserting collaboration group
      insert colGroup; 
       
      //Checking if group was created successfully 
      System.debug('Group was created successfully: ' + colGroup.Name); 
      System.assertEquals('Q3-AdminSupport', colGroup.Name); 
      
      //Creating collection of collaboration group members
      List<CollaborationGroupMember> CollGroupMembers = new List<CollaborationGroupMember>();
      CollaborationGroupMember member = new CollaborationGroupMember();
        
      //Ensuring user is not already part of group
      if(member.MemberId != u.id){ 
         System.debug('User is not part of the group.'); 
         System.assert(member.memberid != u.id); 
      }
       
      //Adds user to group as standard user
      member.MemberId = u.Id ; 
      member.CollaborationGroupId = colGroup.Id ;  
      member.CollaborationRole = 'Standard';
      CollGroupMembers.add(member); 
      insert CollGroupMembers;
       
      //Checking user is now part of the collaboration group
      System.debug('User is part of the group in standard role');
      System.assertEquals('Standard', member.CollaborationRole); 
        
      //Standard User cannot leave collaboration group 
      //Checking trigger to fire and prevent user from leaving 
      if (member.CollaborationRole == 'Standard'){
         try{
            //Attempts to delete member
            delete member; 
            System.assert(false, 'The DELETE should have thrown exception');
             
         }catch(Dmlexception e){
             
            //Cannot delete member due to member being in standard role / trigger preventing user from leaving 
            System.debug('User cannot leave group - in Standard Role: ' + e.getMessage()); 
            System.assertEquals('Standard', member.CollaborationRole);  
         } 
      }  
       
      //Changes member role from Standard to Admin
      if(member.memberId == u.id){ 
         System.debug('Checking user in Standard role');
         member.CollaborationRole = 'Admin';
         update CollGroupMembers;
          
         //Checking user was changed to Admin role
         System.debug('User now in Admin role');
         System.assertEquals('Admin', member.CollaborationRole); 
      }
       
      //Remove user from the group while in Admin role
      if(member.CollaborationRole == 'Admin'){
         delete member; 
         System.debug('Member deleted from the group');
         System.assert(member.id != u.id);  
      }
       
      //End Test
      Test.stopTest(); 
   } 
}
