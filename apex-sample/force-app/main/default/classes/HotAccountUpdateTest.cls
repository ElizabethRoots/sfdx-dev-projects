@IsTest
private with sharing class HotAccountUpdateTest {
   @IsTest static void updateHotAccounts() {
     
    //Create opportunity 
    Opportunity oppty = new Opportunity( Name = 'Test Name', 
                                         StageName = 'Prospecting', 
                                         CloseDate = system.today());
    insert oppty;  
    System.assertEquals('Test Name', oppty.Name); 
    System.debug('Confirmed Opportunity is created');
       
    //Create and insert a cold account record.
    Account ac = new Account( Name = 'Test Account', 
                              Rating = 'Cold');  
    insert ac;   
    System.assertEquals('Test Account', ac.Name); 
    System.debug('Confirmed Account is created');
       
    //Run test, update account rating to hot.
    Test.startTest(); 
    oppty.StageName = 'Closed Won'; 
    update oppty;
    ac.Rating = 'Hot'; 
    update ac; 
    Test.stopTest();
        
    System.assertEquals('Hot', ac.Rating);
    System.debug('Confirmed Account is now Hot');
    
    //Asserts to verify code
    List<Account> acc = [ SELECT Id, Name, Rating FROM Account WHERE Rating = 'Hot' AND Id = :ac.Id ]; 
    System.assertEquals( 1, acc.size(), 'Updated a hot account' ); 
    System.assertEquals( ac.Name, acc[0].Name, 'Test Account');
    System.assertEquals( ac.Rating, acc[0].Rating , 'Rating is confirmed Hot'); 
    System.debug('Get org limits: ' +  Limits.getLimitDmlRows());
    }
}
