@isTest 
private class CreateAccountTest {
    @isTest
    static void try_Create_Account() {
    String acctName = 'Test Account';
    String acctNumber = '123 Best Company';

    Test.startTest();
    CreateAccount newAccount = new CreateAccount();
    Account acct = newAccount.createAccounts( acctName, acctNumber );
    insert acct;
    Test.stopTest();

    List<Account> acnts = [ SELECT Id, Name, AccountNumber FROM Account WHERE Id = :acct.Id ];
    System.assertEquals( 1, acnts.size(), 'Find new account' ); 
    System.assertEquals( acctName, acnts[0].Name, 'Test Account' );
    System.assertEquals( acctNumber, acnts[0].AccountNumber, 'incorrect account number' );
    System.debug('Get org limits: ' +  Limits.getLimitDmlRows());
    }
}
