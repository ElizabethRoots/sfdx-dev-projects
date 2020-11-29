//Created on Oppty obj
trigger HotAccountUpdate on Opportunity (after update) { 
   List<SObject> updateList = new List<SObject>(); 
     
    //Iterate over the accounts, post chatter message with accnt info.
    for ( Account accts : [SELECT Id , Rating 
                                   FROM Account ]) {    
    for ( Opportunity oppty : Trigger.New ) { 
            if (oppty.StageName == 'Closed Won'){
            	accts.Rating = 'Hot';  
            	updateList.add(accts); 
            } 
            update updateList; 
        }  
}
}
