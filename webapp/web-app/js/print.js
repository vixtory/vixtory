
		<!-- this function is for hiding the toolbar --!>
		function hideProperties() {

			<!-- first we clear the div which includes the toolbar --!>
			jQuery('#propertiesLink').html("Properties");

			<!-- after that we show the properties link again --!>
			jQuery('#toolBar').html("");
		}


		<!-- this function is to view the toolbar --!>
		function toolBar() {

		    
			if(jQuery('#propertiesLink').attr("title"=="Options"))
			{
			   jQuery('#propertiesLink').attr("title", "NoOptions").html("Hide properties");

				<!-- this is the for changing the zoom-level --!>
    			var zoomForm = "<form>Zoom level:<select onChange = \"setZoom(value)\"><option value=\"20%\">20%</option><option value=\"40%\" selected>40% (default)</option><option value=\"60%\">60%</option><option value=\"80%\">80%</option><option \"100%\">100%</option></select></form>";

    			<!-- this is the for changing the font-size --!>
		    	var fontForm = "<form>Font size:<select style=\"margin-left: 14px;\"onChange = \"setFont(value)\"><option value=\"8\" selected>8 px</option><option value=\"10\">10 px</option><option value=\"12\" selected>12px (default)</option><option value=\"14\">14px</option></select></form>";

		    	<!-- this is the link for hiding the properties - toolbar --!>
		   	    var hidePropertiesLink = " <br /><a class=\"projListLink\" href=\"javascript:hideProperties()\">Hide properties</a>";

		    	<!-- now we join the three variables --!>
    			var forms = zoomForm + fontForm;

    			<!-- next we print the variables to the toolbar --!>
				jQuery('#toolBar').html(forms);
		    }
			else
			{
			   jQuery('#propertiesLink').attr("title", "Options").html("Properties");
			   hideProperties();
			}
		}

		

	    <!-- this function is for setting the iframe height --!>
		function setIframeHeight(frameName)
		{
  		   var win = window.frames[frameName];
		   if(jQuery('#'+frameName) && win)
		   {
    	      var hg = getFrameHeight(win.document);
    		  if(hg)
			     jQuery('#'+frameName).css({"height":hg + 50 + "px"})
           }
        }

		<!-- this function is for getting the iframe content height --!>
		function getFrameHeight(doc)
		{
  		   var temp = 0;

		   if (doc.height)
		      temp = doc.height;
		   else if(doc.body)
		   {
    		  if (doc.body.scrollHeight)
			     temp = doc.body.scrollHeight;
    	      if (doc.body.offsetHeight)
			     temp = doc.body.offsetHeight;

           }
           return temp;
        }
