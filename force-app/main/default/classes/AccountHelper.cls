/**
 * @description Helper class for updating Account records.
 */
public with sharing class AccountHelper {
    /**
     * @description Updates the Industry field on an Account
     * @param accountId The Id of the Account to update
     * @param newIndustry The new Industry value to assign
     */
    public static void updateAccountIndustry(Id accountId, String newIndustry) {
        if (!Schema.sObjectType.Account.fields.Industry.isUpdateable()) {
            throw new System.NoAccessException('No access to update Account.Industry');
        }

        Account acc = [SELECT Id, Industry FROM Account WHERE Id = :accountId LIMIT 1];
        acc.Industry = newIndustry;
        update acc;
    }
}
