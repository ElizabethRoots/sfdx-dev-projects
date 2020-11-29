public with sharing class CreateAccount {
    public Account createAccounts( String name, String accountNumber ) {
        Account acc = new Account(
            Name = name,
            AccountNumber = AccountNumber = accountNumber
        ); 
        return acc;
    }
}
