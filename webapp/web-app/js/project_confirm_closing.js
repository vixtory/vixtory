	
    // function for confirming the closing of the project
	function confirmClosing()
    {
    if (jQuery('select#status option[value="CLOSED"]').attr("selected")==true)
            return confirm("This action will also close all open versions, are you sure you want to do this?");
	}
		