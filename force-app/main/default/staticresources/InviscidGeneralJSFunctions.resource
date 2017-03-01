// Use this to conditionally add an 's' to a string if the value is not 1
function IGF_addPlural(inputNumber)
{
	if (Number(inputNumber) != 1)
	{
		return 's';
	}
	
	return '';
}

// Use this to find an element that you assigned an id to amongst the Salesforce naming conventions
function IGF_findElement(elementType, elementName)
{
	aryElements = document.getElementsByTagName(elementType);
	
	for (lngX = 0; lngX < aryElements.length; lngX++)
	{
		if (aryElements[lngX] != null && aryElements[lngX].id != '')
		{
			objItem = document.getElementById(aryElements[lngX].id);
			
			if (objItem != null)
			{
				if (objItem.id.indexOf(elementName) > -1)
				{
					return aryElements[lngX];
				}
			}
		}
	}
}

// Use this to find multiple elements that you assigned an id to amongst the Salesforce naming conventions
function IGF_findElements(elementType, elementName)
{
	var objReturn = new Array();

	aryElements = document.getElementsByTagName(elementType);
	
	for (lngX = 0; lngX < aryElements.length; lngX++)
	{		
		if (aryElements[lngX] != null && aryElements[lngX].id != '')
		{
			objItem = document.getElementById(aryElements[lngX].id);
			
			if (objItem != null)
			{
				if (objItem.id.indexOf(elementName) > -1)
				{
					objReturn[objReturn.length]=aryElements[lngX];
				}
			}
		}
	}
	
	return objReturn;
}

// Use this to find an element that you assigned an id to amongst the Salesforce naming conventions, with exclusions
function IGF_findElementExclude(elementType, elementName, exclusions)
{
	var blnExclude;

	aryElements = document.getElementsByTagName(elementType);

	for (lngX = 0; lngX < aryElements.length; lngX++)
	{
		if (aryElements[lngX] != null && aryElements[lngX].id != '')
		{
			objItem = document.getElementById(aryElements[lngX].id);

			if (objItem != null)
			{
				if (objItem.id.indexOf(elementName) > 0)
				{
					blnExclude = false;

					for (lngY = 0; lngY < exclusions.length; lngY++)
					{
						if (objItem.id.indexOf(exclusions[lngY]) > 0)
						{
							blnExclude = true;
							lngY = exclusions.length;
						}
					}
					
					if (blnExclude == false)
					{
						return aryElements[lngX];
					}
				}
			}
		}
	}
}

function IGF_findForLabel(labelFor)
{
	var strFind = labelFor.replace(/%3A/g, ':', true);
	
	aryElements = document.getElementsByTagName('label');

	// Try looking for lookup fields
	if (labelFor.lastIndexOf('TABALookup') > 0 && labelFor.lastIndexOf('xxx') > 0)
	{
		return labelFor.substring(labelFor.lastIndexOf('TABALookup') + 10, labelFor.lastIndexOf('xxx'));
	}

	// Otherwise look up the label text
	for (lngX = 0; lngX < aryElements.length; lngX++)
	{
		if (aryElements[lngX] != null)
		{
			if (aryElements[lngX].htmlFor == strFind)
			{
				return aryElements[lngX].innerHTML.replace('\n','');
			}
			else if (aryElements[lngX].htmlFor == strFind + '_top')
			{
				return aryElements[lngX].innerHTML.replace('\n','');
			}
		}
	}
}

function IGF_fixQuotes(inputString)
{
	return inputString.replace(/&#39;/g, '\'');
}

function IGF_getQuerystring(key)
{
	key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");

	var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
	var qs = regex.exec(window.location.href);
  
	if(qs == null)
	{
		return '';
	}
	else
	{ 
    	return qs[1];
	}
 }

		
function IGF_getValue(inArray, lookup)
{
	for (intX = 0; intX < inArray.length; intX++)
	{
		if (inArray[intX] == lookup && inArray.length > intX+1)
		{
			return inArray[intX+1];
		}
	}
	
	return '';
}

function IGF_IsInteger(input, minValue, maxValue) {
	if (input != input.replace(/[^\d]+/g, '')) {
		return false;
	}
	
	if (input < minValue) {
		return false; 
	}

	if (input > maxValue) {
		return false; 
	}
	
	return true;
} 

			
function IGF_openParent(newLocation)
{
	try
	{
		window.opener.window.location.href = '/' + newLocation;
		window.setTimeout('window.close()', 100);
	}
	catch (e)
	{
		alert(e);
	}
}

function IGF_parentReload()
{
	try
	{
		window.opener.window.location.reload();
		window.setTimeout('window.close()', 100);
	}
	catch (e)
	{
		alert(e);
	}
}

function IGF_Test()
{
	alert('Inviscid General Functions OK');
}
