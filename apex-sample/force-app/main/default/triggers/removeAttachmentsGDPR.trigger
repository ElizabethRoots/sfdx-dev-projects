//Author: Elizabeth DeGroot
//Date: Jan 2018
//Description: Remove Attachments from Cases when GDPR compliant checkbox is true.
trigger removeAttachmentsGDPR on Case (after update) {

  //Declare variables
  public Set<Id> CaseSetId = new Set<Id>();
  List<FeedItem> posts = new List<FeedItem>();

    //Checks if GDPR checkbox is true
    for (Case c: Trigger.new){
        if(c.GDPR_Compliant__c== True){
            CaseSetId.add(c.Id);

        //Puls list of attachments for the case selected
        List<Attachment> casAttmtList = [SELECT Id,ParentId
                                             FROM Attachment
                                             WHERE ParentId in: CaseSetId];

        //Removes attachements from the case.
        delete casAttmtList;

            //Creates a chatter post on the case when GDPR updates are completed
            for(Id cID:CaseSetId){
                String status = 'This case is GDPR updated.'; //Defines chatter post content
                FeedItem post = new FeedItem();
                    post.ParentId = cId;
                    post.Body = status;
                insert post; //Inserts the chatter post
            }
        }
    }
}
