//////////////////////////////
// Page Save Functions
//////////////////////////////

var PSF_SaveButtonActionText = 'Saving';
var PSF_SaveButtonText = 'Save';

$('body').keypress(function (e) {
    if (e.keyCode && e.keyCode == 13 && e.target.type != 'textarea') {
        e.preventDefault();
        hideSave();
        return false;
    }
})

function hideSave()
{
    var blnLaunch = false;
    var objButtons = IGF_findElements('input', 'butSaveButton');

    if (objButtons.length > 0)
    {
	    PSF_SaveButtonText = objButtons[0].value;

	    switch (PSF_SaveButtonText)
	    {
	    	case 'Save':
	    		break;
	    	
	    	case 'Load Sessions':
	    		PSF_SaveButtonActionText = 'Loading Sessions';
	    		break;
	    	
	    	default:
		    	PSF_SaveButtonActionText = PSF_SaveButtonText + 'ing';
		    	break;
	    }

	    window.scroll(0,0);
    }
    
    for (var intX = 0; intX < objButtons.length; intX++)
    {
        // Only launch if the button was previously enabled, to prevent dups
        if (objButtons[intX].disabled != 'disabled')
        {
            blnLaunch = true;
        }

        objButtons[intX].disabled = 'disabled';
        objButtons[intX].className = 'btnDisabled';
        objButtons[intX].value = PSF_SaveButtonActionText + '...';
    }

    if (blnLaunch)
    {
        saveButtonJS();
    }
}

function showSave()
{
    var objButtons = IGF_findElements('input', 'butSaveButton');
    
    for (var intX = 0; intX < objButtons.length; intX++)
    {
        objButtons[intX].disabled = '';
        objButtons[intX].className = 'btn';
        objButtons[intX].value = PSF_SaveButtonText;
    }
}