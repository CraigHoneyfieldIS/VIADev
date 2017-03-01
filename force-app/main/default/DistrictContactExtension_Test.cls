@isTest
public with sharing class DistrictContactExtension_Test
{
    static testMethod void testDistrictContact()
    {
        // Standard Variables
        ApexPages.StandardController sc = null;
        string strTest;

        // Create a district contact

        District_Contact__c testDC;
		
        testDC = new District_Contact__c();
        testDC.First_Name__c = 'District';
        testDC.Last_Name__c = 'Contact';
        insert testDC;

        System.Assert(testDC != null);
        
        //PageReference prf = sc.save();

        // Create the controller
        sc = new ApexPages.StandardController(testDC);
        DistrictContactExtension contMain = new DistrictContactExtension(sc);

        // Test Properties as edit
        strTest = contMain.NewEdit;

        testDC.First_Name__c = 'Test';
        testDC.Last_Name__c = 'Contact';
        contMain.save();
        
        try
        {
            upsert testDC;
            system.assert(true);
        }
        catch (Exception ex)
        {
            system.assert(false);
        }
        strTest = contMain.NewEdit;
     
		testDC.First_Name__c = '';
		testDC.Last_Name__c = '';
		contMain.save();
		try
        {
            upsert testDC;
            system.assert(false);
        }
        catch (Exception ex)
        {
            system.assert(true);
        }

		try
        {
            delete testDC;
            system.assert(true);
        }
        catch (Exception ex)
        {
            system.assert(false);
        }
		

    }
}