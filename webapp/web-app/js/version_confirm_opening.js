
function confirmOpening() 
{
    if (jQuery('select#status option[value="IN_PROGRESS"]').attr("selected")==true)
			return confirm("This action will open the project, are you sure you want to do this?");
	}

