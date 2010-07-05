            


function hide_show_requirementsBar(image){
			

            if(image.alt == '+')
            {
				image.src = jQuery('#contextpath').val() + '/images/hideReqBar.png';
				image.alt = '-';
			    jQuery('#requirementsBar').show();
                jQuery('#iframe').css({"width" : "100%"});
			}
			else
            {
				image.src = jQuery('#contextpath').val()+ '/images/showReqBar.png';
				image.alt = '+';
				jQuery('#requirementsBar').hide();
                jQuery('#iframe').css({"width" : "800px"});
             }
		}

		function expand_collapse_link(image, id) {
			if(image.alt == '+')
            {
				image.src = jQuery('#contextpath').val()+ '/images/minus.jpg';
				image.alt = '-';
				jQuery('#'+image.name + '_id').show();
			    addOpenedValue(id);
			}
			else
            {
				image.src = jQuery('#contextpath').val()+ '/images/plus.jpg';
				image.alt = '+';
				jQuery('#'+image.name + '_id').hide();
				removeOpenedValue(id);
			}
		}

		function showSubDiv(id)
		{
		   if(jQuery("#reqData"+id+"_id").is(':hidden'))
		   {
		      jQuery("#reqData"+id+"_id").show();
			  jQuery("#requirementImage"+id).attr("src", jQuery('#contextpath').val()+ '/images/minus.jpg').attr("alt", '-');
              addOpenedValue(id);
		   }
		   else
		   {
		      jQuery("#reqData"+id+"_id").hide();
			  jQuery("#requirementImage"+id).attr("src", jQuery('#contextpath').val()+ '/images/plus.jpg').attr("alt", '+');
              removeOpenedValue(id);
		   }
		}
    <!--This prevents browser not to cache iframes content  --!>
	<!--	var iframeSrc = "${createLinkTo(dir:'proxy', file:'index.html')}"; --!>
		<!--(document.frames || window.frames)['projectPage'].location.href = iframeSrc + "?" + (new Date()).getTime();		 --!>


		
        jQuery(document).ready(function(){
			var headerHeight = $('#header').height()-41;
			$("#projectPage").attr("height", headerHeight);
            jQuery('#vixcontent').css({'background-color':'#404040'});
            disableButtons();
            jQuery('#toolBar').draggable({iframeFix:true});

            jQuery('#toolBar').bind('dragstop', function(event, ui) {
                jQuery('div.ui-draggable-iframeFix').remove();
            });
            <!-- Fetch requirements on every page load --!>
            getRequirements();

            jQuery('#hideall').click(function(){
               jQuery(this).hide();
               jQuery('#showall').show();
               jQuery('#projectPage').contents().find('.VixtoryPopUp').show();

            });
            jQuery('#showall').click(function(){
               jQuery(this).hide();
               jQuery('#hideall').show();
               jQuery('#projectPage').contents().find('.VixtoryPopUp').hide();
            });




            
        });


			<!-- array stores information related to the opened requirement subdivs --!>
				var openedDivs = new Array();

				function setSession(val)
				{
				  jQuery('#currsess').value = val;
				}

				<!-- Adds div to the opened divs array --!>
				function addOpenedValue(value)
				{
				   var tempIf = true;

				   for(var i = 0; i < openedDivs.length; i++)
				   {
				      if(openedDivs[i] == value)
					  {
					     tempIf = false;
						 break;
					  }
				   }
				   if(tempIf)
				   {
				      openedDivs.push(value);
				   }

				}

				<!-- Removes specified div from opened divs array --!>
				function removeOpenedValue(val)
				{
				   for(var i = 0; i < openedDivs.length; ++i)
				   {
				      var temp = openedDivs[i];

					  if(val == temp)
					  {
					     openedDivs.splice(i, 1);
					  }
				   }
				}

				<!-- Refreshes the opened subdivs after updates on requirements --!>
				function updateOpenedDivs()
				{
				   for(var j = 0; j < openedDivs.length; j++)
				   {
				      var tempId = openedDivs[j];

					  if(jQuery("#reqData"+tempId+"_id"))
					  {
   	                     var image = jQuery("#requirementImage"+tempId);

                         if (jQuery("#reqData"+tempId+"_id").is(":hidden"))
					     {
					   	    jQuery("#reqData"+tempId+"_id").show();
					   	    image.src = jQuery('#contextpath').val()+ '/images/minus.jpg';
					   	    image.alt = '-';
					     }
					  }
				   }
				}

                <!-- select all checkboxes --!>
                function selectAll()
                {
                   var allBoxes = jQuery('.box[name="selectedRequirements[]"]');

                   if(jQuery('#selectall').attr('checked') == true)
                   {
                      for(var i = 0; i < allBoxes.length; i++)
                      {
                         allBoxes[i].checked=true;
                         jQuery("#resolve").attr("disabled",false);
                         jQuery("#delete").attr("disabled",false);
                       }

                   }
                   else
                   {
                      for(var i = 0; i < allBoxes.length; i++)
                      {
                         allBoxes[i].checked=false;
                         jQuery("#resolve").attr("disabled",true);
                         jQuery("#delete").attr("disabled",true);
                      }

                   }
                }

               <!-- Disable reopen-button after press      --!>
               function reopenPress()
                    {
                     jQuery("#reopen").attr("disabled",true);
                    }

                <!-- function to disable all buttons  --!>
                function disableButtons()
                    {
                    jQuery("#selectall").attr("checked",false);
                    jQuery("#resolve").attr("disabled",true);
                    jQuery("#delete").attr("disabled",true);
                    jQuery("#reopen").attr("disabled",true);
                    }

                function disableBoxes()
                    {
                    jQuery('.box[name="selectedRequirements[]"]').attr("disabled", "true");
                    jQuery('#selectall').attr("disabled", "true");
                    jQuery('.boxAndEdit img').hide();
                    jQuery('#addLink').hide();
                    jQuery('#printLink').hide();
                    jQuery('.b').hide();
                    }
                 function enableBoxes()
                 {
                    jQuery('.box[name="selectedRequirements[]"]').removeAttr('disabled');
                    jQuery('#selectall').removeAttr('disabled');
                    jQuery('.boxAndEdit img').show();
                    jQuery('#addLink').show();
                    jQuery('#printLink').show();
                    jQuery('.b').show();
             }

             <!-- check if there are checked chekboxes after some checkbox is chechked/unchecked  --!>

             function checkCheckBoxes(boxtype) {

                if(boxtype == "openrequirements" ) {

                    var allBoxes = jQuery('.box[name="selectedRequirements[]"]');
                    var checked = false;
                    var j = 0;

                    for(var i = 0; i < allBoxes.length; i++)
                    {
                     if (allBoxes[i].checked == true)
                        {
                        checked = true;
                        j++;
                        }
                    }

                    if (allBoxes.length == j)
                        {
                        jQuery("#selectall").attr('checked',true);
                        }


                    if (checked == true)
                        {
                         jQuery("#resolve").attr("disabled",false);
                         jQuery("#delete").attr("disabled",false);
                        }
                    else
                        {
                         disableButtons();
                        }

                }
                else
                    {
                    var allBoxes = jQuery('.box[name="reopenedRequirements[]"]');
                    var checked = false;

                    for(var i = 0; i < allBoxes.length; i++)
                        {
                         if (allBoxes[i].checked == true)
                         checked = true;
                        }

                    if (checked == true)
                        {
                         jQuery('#reopen').attr('disabled',false);
                        }
                    else
                        {
                         jQuery('#reopen').attr('disabled',true);
                        }
                    }
                }


		function showSpinner()
        {
			jQuery('#spinner').show();
		}
		function hideSpinner()
        {
			jQuery('#spinner').hide();
		}

		<!-- Reload iframe after we have set new source for it --!>
		function reloadIframe()
        {
			window.frames['projectPage'].location.reload(true);
			setTimeout("hideSpinner()",1500);
		}

		function deleteReq(req)
        {
			jQuery("#" + req).html("");
			jQuery('#requirements').removeChild(jQuery("#" + req));
		}

		function addRequirement() {

            var iDocument = document.getElementById("projectPage").contentWindow.document;
            if (iDocument.getElementById('greyScreen')) {
				var screen = iDocument.getElementById('greyScreen');
				screen.parentNode.removeChild(screen);
                enableBoxes();
                }
                


            else { clickPosition(); }
		}

		<!-- This is the function which shows the save/edit dialog. The parameters are not defined. --!>
		function showDialog(action, paramOne, paramTwo) {

            <!-- If action is save --!>
			if (action == "save") {

				<!-- the default selected field is "Major" --!>
				jQuery('select#priority option[value="MAJOR"]').attr('selected',true);

				<!-- We set the action type to save --!>
                jQuery('#actionType').val('save');
                jQuery('#creator').val(jQuery('#userRealName').val());
                <!-- the parameter one is the mouse x (int) --!>
				var x = paramOne;

				<!-- the parameter two is the mouse y (int) --!>
				var y = paramTwo;

				<!-- view url is the title --!>
				var viewURL = jQuery('#title').val();

				<!-- We show the hidden form elements --!>
				jQuery('#hiddenValues').html("<input type=\"hidden\" name=\"viewURL\" value=\"" + viewURL + "\" /><input type=\"hidden\" name=\"mouseX\" value=\"" + x + "\" /><input type=\"hidden\" name=\"mouseY\" value=\"" + y + "\" /><input type=\"hidden\" name=\"status\" value=\"open\" />");

				<!-- We change the topic --!>
				jQuery('#dialogTopic').html("Add new requirement");
			}
			<!-- If action is edit --!>
			else if (action == "edit") {

				<!-- We set the action type to update --!>
				jQuery('#actionType').val('update');

				<!-- the parameter one is the requirement (shortname+id) (string) --!>
				var req = paramOne;

				<!-- the parameter two is the requirement id (int) --!>
				var reqId = paramTwo;

				<!-- We show the hidden form elements --!>
				jQuery('#hiddenValues').html("<input type=\"hidden\" name=\"reqId\" value=\"" + reqId + "\" />");

				<!-- we change the hidden input-fields as the requirements values --!>
				jQuery("#smallTitle").val(jQuery("#title-" + req).html());
	        	jQuery("#creator").val(jQuery("#creator-" + req).html());
		        jQuery("#description").val(jQuery("#" + req).html());

				<!-- we set the requirements priority as selected       	        --!>
                jQuery('select#priority option[value="' + jQuery("#priority-" + req).html() + '"]').attr('selected',true);

				<!-- We change the topic --!>
				jQuery('#dialogTopic').html("Edit requirement");
            }
			<!-- we show the dialog --!>
			jQuery('#dialog').show();

		}

		<!-- this is the function which closes the dialog --!>
		function hideDialog() {

            enableBoxes();
    		<!-- we set the hidden input-fields as empty --!>
            //document.getElementById("creator").value = "";
            jQuery("#description").val("");
            jQuery("#smallTitle").val("");

			<!-- we reset the error-dialogs --!>
			jQuery("#dialogError").hide();
			jQuery('#descriptionErrorValue').hide();
            jQuery('#descriptionlengthErrorValue').hide();
            jQuery('#titleErrorValue').hide();
            jQuery('#titlelengthErrorValue').hide();
            jQuery('#creatorErrorValue').hide();
            jQuery('#creatorlengthErrorValue').hide();


            <!-- we set the select input-field as the first option --!>
            jQuery("select#priority[options[0]]").attr("selected",true);

			<!-- we hide the edit dialog --!>
			jQuery('#dialog').hide();
            getRequirements();



           //disableButtons();

            var iDocument = jQuery("#projectPage")[0].contentWindow.document;
            if ( jQuery('#projectPage').contents().find("#greyScreen"))
            {
                jQuery('#projectPage').contents().find("#greyScreen").remove();
            }
		}

		function isIE()
        {
			return /msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent);
		}

		function howTall(iDocument)
        {

			if (typeof iDocument.height!= 'undefined') {
				docHeight = iDocument.height;
			} else if (iDocument.compatMode && iDocument.compatMode!= 'BackCompat') {
				docHeight = iDocument.documentElement.scrollHeight;
			} else if (iDocument.body && typeof iDocument.body.scrollHeight!= 'undefined') {
				docHeight = iDocument.body.scrollHeight;
			}
			 return docHeight;
		}

		function howWide(iDocument)
        {
			if (typeof iDocument.body.scrollWidth != 'undefined') {
				docWidth = iDocument.body.scrollWidth;
			} else if (iDocument.compatMode && iDocument.compatMode!= 'BackCompat') {
				docWidth = iDocument.documentElement.scrollWidth;
			}

			return docWidth;
		}

		function clickPosition()
        {
            jQuery('.box[name="selectedRequirements[]"]').attr("disabled", "true");
            jQuery('.box [name="selectall').attr("disabled", "true");
			<!-- Iframe document object --!>
			var iDocument = jQuery("#projectPage")[0].contentWindow.document;
            var screen = iDocument.createElement('div');
            screen.setAttribute('id','greyScreen');
            iDocument.body.appendChild(screen);
            height = howTall(iDocument) + "px";
			width = howWide (iDocument)  + "px";
            jQuery('#projectPage').contents().find("#greyScreen").css({
                'position' : 'absolute',
                'left' : '0px',
                'width' : width,
                'height' : height,
                'zIndex' : "1000",
                'top' : '0px',
                'opacity' : '0.6',
                'background-color': 'black',
                'cursor' : 'crosshair'
            });
			if(isIE())
			screen.style.filter = "alpha(opacity=60)";

            screen.onmousemove = getMouseXY;
			screen.onclick = setMouseXY;

			
		}

		// Temporary variables to hold mouse x-y pos.s
		var tempX = 0;
		var tempY = 0;

		function getMouseXY(e)
        {
			<!-- Iframe document object --!>
			var iDocument = document.getElementById("projectPage").contentWindow.document;
			var iWindow = document.getElementById("projectPage").contentWindow;

			if (isIE()) {
			    tempX = iWindow.event.clientX + iDocument.body.scrollLeft;
			    tempY = iWindow.event.clientY + iDocument.body.scrollTop;
			}
			else {
			    tempX = e.pageX;
			    tempY = e.pageY;
			}

			if (tempX < 0) tempX = 0;
			if (tempY < 0) tempY = 0;

			// show the position values in the form named Show
			// in the text fields named MouseX and MouseY
            jQuery('#projectPage').contents().find("#MouseCoordX").val(tempX);
            jQuery('#projectPage').contents().find("#MouseCoordY").val(tempY);
			return true;
		}

		function setMouseXY()
        {
			var X = tempX;
			var Y = tempY;
			showDialog("save", X, Y);
		}

		var activePopup = null;
		var activeReq = null;

        function showPopup(x, y, req, target)
        {
            var iDocument = jQuery("#projectPage")[0].contentWindow.document;
		    target.style.background = "#DDDDDD";
		    
			if (!iDocument.getElementById(req) && iDocument.body != null) {
				var reqPopup = iDocument.createElement('div');
	 
                reqPopup.setAttribute('id', req);
                reqPopup.setAttribute('class', 'VixtoryPopUp');
                iDocument.body.appendChild(reqPopup);
                <!-- popup styles --!>
                var requirement_wdw = jQuery('#projectPage').contents().find("#" + req );
                requirement_wdw.css(    'height' , '90px');
                requirement_wdw.css(    'overflow' , 'auto');
                requirement_wdw.css(    'size' , 'auto');
                requirement_wdw.css(    'auto' , '11px');
                requirement_wdw.css(    'fontSize' , '11px');
                requirement_wdw.css(    'font-family' , 'Verdana, Serif');
                requirement_wdw.css(    'display' , 'block');
                requirement_wdw.css(    'left' , x + 'px');
                requirement_wdw.css(    'top' , y + 'px');
                requirement_wdw.css(    'width' , '180px');
                requirement_wdw.css(    'position' , 'absolute');
                requirement_wdw.css(    'zIndex' , '1000');
                requirement_wdw.css(    'background-color' , '#ffffff');
                requirement_wdw.css(    'border' , '2px solid black');
                

                if(isIE())
					reqPopup.style.filter = "alpha(opacity=80)";

				<!-- Titlebar for popup where user can drag popup --!>
				var titleBar = iDocument.createElement('div');
				titleBar.setAttribute('id', 'title_'+req);
                reqPopup.appendChild(titleBar);
                requirement_title = jQuery('#projectPage').contents().find('#title_'+req);
                requirement_title.css(    'height' , '13px');
                requirement_title.css(    'width' , '100%');
                requirement_title.css(    'font-weight' , 'bold');
                requirement_title.css(    'border-bottom' , '1px solid black');
                requirement_title.css(    'cursor' , 'move');
                requirement_title.css(    'background-color' , '#ff0000');
                requirement_title.css(    'color' , '#000000');
                requirement_title.html(req);

				<!-- js events --!>
				titleBar.onmousedown = dragInit;
				titleBar.onmouseup = stop;

                var url = window.location.protocol + '//' + window.location.hostname;
                if (window.location.port != null)
                    url += ':' + window.location.port;
                url += jQuery('#contextpath').val();
                
				<!-- Content for popup --!>
				var content = iDocument.createElement('div');
				content.setAttribute('id', 'content_'+req);
                reqPopup.appendChild(content);
				var editBar=iDocument.createElement('div');
                editBar.setAttribute('id', 'edit_'+req);

                var resolveLink = iDocument.createElement('a');
                resolveLink.setAttribute('id', 'resolveLink_'+req);
                resolveLink.setAttribute('href', '#');
                resolveLink.innerHTML = 'Resolve ';
                editBar.appendChild(resolveLink);

                var reopenLink = iDocument.createElement('a');
                reopenLink.setAttribute('id', 'reopenLink_'+req);
                reopenLink.setAttribute('href', '#');
                reopenLink.innerHTML = 'Reopen';
                editBar.appendChild(reopenLink);
                
                var editLink = iDocument.createElement('a');
                editLink.setAttribute('id', 'editLink_'+req);
                editLink.setAttribute('href', '#');
                editLink.innerHTML = '<img src="' + url + '/images/edit.png"/>';
                editBar.appendChild(editLink);

                var deleteLink = iDocument.createElement('a');
                deleteLink.setAttribute('id', 'deleteLink_'+req);
                deleteLink.setAttribute('href', '#');
                deleteLink.innerHTML = '<img src="' + url + '/images/trash.png"/>';
                editBar.appendChild(deleteLink);

                reqPopup.appendChild(editBar);
                jQuery('#projectPage').contents().find('#reopenLink_'+req).hide();

                jQuery('#projectPage').contents().find('.VixtoryPopUp').find('a').css({
                    'color':'#666',
                    'text-decoration':'none',
                    'font-weight':'normal',
                    'vertical-align':'super'
                });

                var reqArray = req.split("-");
                var index = reqArray.length - 1;
                var id = reqArray[index];

                jQuery('#projectPage').contents().find('#editLink_'+req).click(function(){
                    showDialog('edit', req, id);
                    return false;
                });
                jQuery('#projectPage').contents().find('#deleteLink_'+req).click(function(){
                   if (confirmDelete()){
                       jQuery.ajax({
                            type:'POST',
                            url:jQuery('#contextpath').val() + '/requirement/' + id + '/delete',
                            success:function(){
                                jQuery('#projectPage').contents().find('#' + req).remove();

                            }
                        });
                   }
                    return false;
                });

               jQuery('#projectPage').contents().find('#resolveLink_'+req).click(function(){
                    jQuery.ajax({
                            type:'POST',
                            url:jQuery('#contextpath').val() + '/requirement/' + jQuery('#version').val() + '/resolve',
                            data:{'selectedRequirements[]':id},
                            success:function(){
                                jQuery('#projectPage').contents().find('#' + req).remove();
                                jQuery('#projectPage').contents().find('#resolveLink_'+req).hide();
                                jQuery('#projectPage').contents().find('#reopenLink_'+req).show();
                            }
                             });
                    return false;
                });

                jQuery('#projectPage').contents().find('#reopenLink_'+req).click(function(){

                        jQuery.ajax({
                            type:'POST',
                            url:jQuery('#contextpath').val() + '/requirement/' + jQuery('#version').val() + '/reopen',
                            data:{'selectedRequirements[]':id},
                            success:function(){
                                jQuery('#projectPage').contents().find('#title_'+req).html(req);
                                jQuery('#projectPage').contents().find('#reopenLink_'+req).hide();
                                jQuery('#projectPage').contents().find('#resolveLink_'+req).show();
                                }
                         });
                         return false;
                     });


                jQuery('#projectPage').contents().find('#content_'+req).css({
                    'padding':'5px',
                    'height':'28px'
                }).html(jQuery('#'+ req).html());
                jQuery('#projectPage').contents().find('#edit_'+req).css({
                    'border-top':'solid black 1px',
                    'padding':'2px',
                    'height':'25px',
                    'text-align':'right'
                });
				 	
			}
			else {
			
				/*var requirement = jQuery('#projectPage').contents().find('#'+req);
				requirement.css("left", x + "px");
				requirement.css("top", y + "px");
				requirement.show();
				
				
    			<!-- we get the id of the requirement --!>
    			var inner = jQuery('#'+ req).html();
			    requirement.html(inner);*/

				
			}
		}




		function hidePopup(req,target) {
			<!-- If req is active popup then we dont want to close it --!>
			if (activePopup != req) {
				target.style.background = "";

				var iDocument = document.getElementById("projectPage").contentWindow.document;
				iDocument.getElementById(req).style.display = "none";
			}
		}

		function activatePopup(req,target) {
			<!-- If there is already an active popup then close it first --!>
			if(activePopup){
				var iDocument = document.getElementById("projectPage").contentWindow.document;
				iDocument.getElementById(activePopup).style.display = "none";
				activeReq.style.background = "";
			}

			<!-- If currently active req is the same as clicked req then we dont activate it again --!>
			if(activePopup != req) {
				activePopup = req;
				activeReq = target;
				target.onmouseover();
			}
			else {
				activePopup = null;
				activeReq = null;
			}
		}


		<!-- function to check the errors from the ajax-form --!>
		function checkErrors() {

			<!-- if there is errors, print it in the dialog --!>

			if (jQuery('#errorValue').html() == "true") {
				jQuery('#dialogError').show()

				<!-- if there is error in the description or title, print the error --!>

				if (jQuery('#descriptionError').html() == "true")
					jQuery('#descriptionErrorValue').show()
				else
					jQuery('#descriptionErrorValue').hide()

				if (jQuery('#titleError').html() == "true")
					jQuery('#titleErrorValue').show()
				else
					jQuery('#titleErrorValue').hide()

				if (jQuery('#creatorError').html() == "true")
					jQuery('#creatorErrorValue').show()
				else
					jQuery('#creatorErrorValue').hide()

            }

			<!-- if no errors, close the dialog --!>
			else {
				
				hideDialog();
				getRequirements();
			}

		}

     function getRequirements() {
          var url = jQuery('#listReqs').val();
          var currentUrl = jQuery('#title').val();

          jQuery('#requirements').load(url, {
                'status': 'open',
                'currentURL': currentUrl
          },function (response) {

        	  //get the anount of the children
        	  var childrenSize=jQuery('#requirements').children().size();
        	  //we take the unneccessary children away
        	  childrenSize=Number(childrenSize)-4;
        	  //show the requirement divs
        	  for(i=0;i<childrenSize;i++){
        		  var v=jQuery(jQuery('#requirements').children()[i]);
        		  v1=new String();
        		 
        		  v1=String(v.attr('onmouseover'));
        		  v1 = v1.split("{")[1];
        		  v1 = v1.split("(")[1];
        		  
        		  var array=v1.split(",");
        		  var a=array[2].substr(1);
        		  a=a.replace(/'/,'');
        		  a=a.replace(/"/,'');
        		  a=a.replace(/"/,'');
        		  
                  a=a.replace(/^\s+|\s+$/g, '')
                  showPopup(array[0],array[1],a,this);

        	  }
        	  jQuery('#requirements').hide();
          });

          jQuery('#resolvedRequirements').load(url, {
                'status': 'resolved',
                'currentURL': currentUrl
          });
}
