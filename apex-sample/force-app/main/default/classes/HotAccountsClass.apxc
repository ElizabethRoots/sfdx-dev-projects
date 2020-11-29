public with sharing class HotAccountsClass {
    public static void afterUpdate() {
       
       //Create empty list to store 
       List<SObject> updateList = new List<SObject>();
        
       //Identify the accounts that match the criteria
       List<Account> acctsWithOppty = [SELECT Id , Name, Rating, (SELECT Id 
                                                    FROM Opportunities 
                                               WHERE StageName = 'Closed Won') 
                                             FROM Account
                                          WHERE Id = '0016g00000AaxV9AAJ'];
    
       //Iterate over the accounts, post chatter message with accnt info.
       for ( Account acct : acctsWithOppty ) {  
               acct.Rating = 'Hot';  
               updateList.add(acct);  
       }  
        update updateList; 
    }
   //List<Account> accts =  new List<Account>();
   //For(Account accts : [SELECT Name, Rating 
   //					   FROM Account]){
  // For(Opportunity opp : trigger.new){
  //     if(opp.stagename == 'closed won'){
  //         acc.Rating = 'hot';
   //        accounts.add(acc);
   //    }
   //}
   // }update accounts;
      //   if (oppty = closed won, then account rating = hot)
      //   trigger on oppty obj
      //    add the parent account ID to a set
//     }   
}
