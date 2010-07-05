jQuery(document).ready(function(){
   jQuery('.deleteProject').click(function(){
       var id = jQuery(this).attr('id');
       if(confirmDelete()){
           jQuery.ajax({
               type:'POST',
               url:jQuery('#contextpath').val() + '/project/' + id + '/delete',
               success:function(){
                   deleteField('project' + id);
                   deleteField('versionList' + id);
               }
           });

       }
   });
  jQuery('.deleteVersion').click(function(){
   var id = jQuery(this).attr('id');
   var array = id.split('-');
   var projectId = array[0];
   var versionId = array[1];
   if(confirmDelete()){
       jQuery.ajax({
           type:'POST',
           url:jQuery('#contextpath').val() + '/version/' + versionId + '/delete',
           success:function(){
               deleteField('project' + projectId + 'version' + versionId);
           }
       });

   }
});
});

function expandProject(projectId) {
		<!-- we change + to - --!>
		jQuery('#sizeChange' + projectId).html("<a href=\"javascript:reduceProject(" + projectId + ")\" class=\"noDecoration\">-</a>");
		<!-- here we unhide the contents --!>
		jQuery('#versionList' + projectId).show();
	}
	function reduceProject(projectId) {
		<!-- we change - to + --!>
		jQuery('#sizeChange' + projectId).html("<a href=\"javascript:expandProject(" + projectId + ")\" class=\"noDecoration\">+</a>");
		<!-- here we hide the contents --!>
		jQuery('#versionList' + projectId).hide();
	}

     function more(field, Id) {
		<!-- here we expand the length of the description/title --!>
		jQuery('#fulltext' + field + Id).show();
    	jQuery('#smalltext' + field + Id).hide();
    }

    function less(field, Id) {

        <!-- here we reduce the length of the description/title --!>
     	jQuery('#fulltext' + field + Id).hide();
    	jQuery('#smalltext' + field + Id).show();
	}


    function change(val)
	{
 	    var idx = val.selectedIndex;
	    var which = val.options[idx].value;
        window.location = 'vixtory/project/list' + which
	}

	<!-- function for confirming opening closed version --!>
	function confirmVersionOpen() {
		return confirm("Version is closed, are you sure you want to view it?");
	}
	<!-- function for confirming opening closed project --!>
	function confirmProjectOpen() {
		return confirm("Project is closed, are you sure you want to view it?");
	}
