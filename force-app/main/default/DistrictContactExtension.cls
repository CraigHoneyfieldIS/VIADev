public with sharing class DistrictContactExtension {
    ///////////////////////////////
    // Private Variables
    ///////////////////////////////
    private ApexPages.StandardController stdC;
    private boolean blnNew = false;
    private District_Contact__c thisDC = null;


    ///////////////////////////////
    // Constructor
    ///////////////////////////////
    public DistrictContactExtension(ApexPages.StandardController aCont) {
        stdC = aCont;
        thisDC = (District_Contact__c) stdC.getRecord();
        blnNew = stdC.getId() == null;
    }
    ///////////////////////////////
    // Overrides
    ///////////////////////////////
    public PageReference Save() {
        if (thisDC.First_Name__c == '' || thisDC.First_Name__c == null) {
            thisDC.addError('First Name is required.');
        }

        if (thisDC.Last_Name__c == '' || thisDC.Last_Name__c == null) {
            thisDC.addError('Last Name is required.');
        }
        
		thisDC.Name = thisDC.First_Name__c  + ' ' + thisDC.Last_Name__c; 
		
        if (ApexPages.hasMessages(ApexPages.Severity.ERROR)) {
            return null;
        }

        return stdC.Save();
    }
    ///////////////////////////////
    // Properties
    ///////////////////////////////
    public string Warnings { get; set; }

    public string NewEdit {
        get {
            if (stdC.getId() == null)
            {
                return 'New ' + stdC.getRecord().getSObjectType().getDescribe().getLabel();
            }
            else
            {
                return 'Edit ' + stdC.getRecord().get('Name');
            }
        }
    }

    
}