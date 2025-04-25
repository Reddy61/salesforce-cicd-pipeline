@isTest
private class AccountHelperTest {
    @isTest
    static void testUpdateAccountIndustry() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Test.startTest();
        User testUser = [SELECT Id FROM User WHERE Profile.Name = 'Standard User' LIMIT 1];
        System.runAs(testUser) {
            AccountHelper.updateAccountIndustry(acc.Id, 'Technology');
        }
        Test.stopTest();

        Account updated = [SELECT Industry FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Technology', updated.Industry);
    }
}
