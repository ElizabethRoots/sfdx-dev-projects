/* Author: Elizabeth DeGroot
 * Date: Nov 2017
 * Description: Chatter trigger to prevent users from leaving specific mandatory chatter group in Appulse.*/
trigger preventUserLeavingMandatoryGrp on CollaborationGroupMember (before update, before delete) {    
 
//Define the chatter group trigger should fire on
Id cgid = [Select Name From CollaborationGroup Where name = 'Q3-AdminSupport' LIMIT 1].Id;         
        
//Trigger set to fire before record update and prevent standard members from leaving the group
if (Trigger.isBefore) {
    if (Trigger.isDelete) { 
        
        //ensure trigger is firing for specific chatter group
        if(cgid != null) { 
            for (CollaborationGroupMember cgm: Trigger.old) { 
                
                //Message is triggered for non-admin users
                if (cgm.CollaborationRole != 'Admin') { 
                    cgm.addError('Apologies! You can not opt out of this group. It is the primary way for you to stay updated about what is going with Appulse. Questions? Please reach out to the Appulse Admins in this group here! Mahalo!');           
                }  
            }
        }
    } 
}
}
