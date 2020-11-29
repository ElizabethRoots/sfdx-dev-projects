//Author: Elizabeth DeGroot
//Date: Feb 2018
//Description: Unit test for removeAttachmentsGDPR trigger.
//The purpose of this trigger is to specifically test attachment deletion from case when GDPR = true
@isTest
public class RemoveAttachmentsGDPRTest {

   @istest
   public static void AttachmentTest(){

      //Starting Test
      Test.startTest();

      //Create case
      Case testCase = new Case();
      testCase.user_email__c ='testing@appulse.com';
      testCase.status = 'New';
      testCase.GDPR_Compliant__c = true;
      insert testCase;

      //Checks if case is inserted and is GDPR checkbox on case = true
      if(testCase.GDPR_Compliant__c == true){
         System.debug('Case was inserted successfully: ' + testCase.Id);
         System.assert(testCase.GDPR_Compliant__c);
         System.assert(testcase.id != null);
      }

      //Create attachment for testing
      Attachment attach  = new Attachment();
      attach.Name='Unit Test Attachment';
      Blob bodyBlob=Blob.valueOf('Unit Test Attachment Body');
      attach.body = blob.valueof('attachment body');
      attach.IsPrivate = false;
      attach.Description = 'Test';
      attach.ParentId = testCase.Id;

      //Inserts the attachment and updates the case
      insert attach ;
      update testCase;

      //Checks if attachment was created
      System.debug('Attachment created: ' + attach.Id);
      System.assert(attach.id != null);

      //Declare variables
      List<Attachment> attachmentOnCase = [select id, name, parentId  from Attachment where name = 'Unit Test Attachment' AND parent.id =: testCase.Id ];

      //Confirms attachment is associated with case
      if(attach.ParentId == testCase.id){
         System.debug('Attachment ' + attach.id + 'is attached to case ' + testCase.id );
         System.assertEquals(testCase.id, attach.ParentId);
      }

      //Deletes attachment from case
      if(attach.name == 'Unit Test Attachment'){
         delete attachmentOnCase;
         update testcase;

         //Checks that attachment has been deleted
         System.debug( 'Attachment has been successfully deleted');
         System.assertEquals(0, attachmentOnCase.size());
      }

      //Creating chatter post to confirm Attachments have been deleted
      List<FeedItem> feedList = new List<FeedItem>();
      FeedItem post = new FeedItem();
      post.Body = 'Case Attachment Deleted';
      post.parentid = testCase.id;

      //Insert post on Case Chatter / Attachment deleted
      insert post;
      System.assertEquals('Case Attachment Deleted', post.Body);

      //End of test
      Test.stopTest();
   }
}
