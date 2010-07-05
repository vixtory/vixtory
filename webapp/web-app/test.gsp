<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
    </head>
    <body>
		<!-- The old HTML inside next comment -->

		<!--
        	<h1 style="margin-left:20px;">Welcome to Grails</h1>
       	 <p style="margin-left:20px;width:80%">Congratulations, you have successfully started your first Grails application! At the moment
       	 this is the default page, feel free to modify it to either redirect to a controller or display whatever
      	  content you may choose. Below is a list of controllers that are currently deployed in this application,
       	 click on each to execute its default action:</p>
       	 <div class="dialog" style="margin-left:20px;width:60%;">
          	  <ul>

          	   <g:each var="c" in="${grailsApplication.controllerClasses}">
         	          <li class="controller"><a href="${c.logicalPropertyName}">${c.fullName}</a></li>
          	   </g:each>
        	   </ul>
			-->

			<!-- Examples of all the mappings -->

			<h1 style="margin-left:20px;">Examples of all the mappings</h1>
			<h2 style="margin-left:20px;">Common project actions</h2>
			<p style="margin-left:20px;width:80%; padding-top: 5px;">
				<a href="project/list">List projects</a>
				<br /><br />
				<a href="project/add">Add a project</a>
				<br /><br />
				<hr />
				<br />
			</p>
			<h2 style="margin-left:20px;">Single project actions</h2>
			<p style="margin-left:20px;width:80%; padding-top: 5px;">
				<br />
				<a href="project/example_project/view">View a project</a>
				<br /><br />  
				<a href="project/example_project/edit">Edit a project</a>
				<br /><br />
				<hr />
				<br />
			</p>
			<h2 style="margin-left:20px;">Version -actions</h2>
			<p style="margin-left:20px;width:80%; padding-top: 5px;">
				<br />
				<a href="project/example_project/v1.2">View a version</a>
				<br /><br />
				<a href="project/example_project/v1.2/edit">Edit a version</a>
				<br /><br />
				<a href="project/example_project/v1.2/add">Add a version</a>
				<br /><br />
				<hr />
				<br />
			</p>

			<h2 style="margin-left:20px;">Printing the view</h2>
			<p style="margin-left:20px;width:80%; padding-top: 5px;">
				<br />
				<a href="project/example_project/v1.2/print">Print the view</a>
				<br /><br />
				<hr />
			
			</p>

			<!-- Let's print all the controller classes -->
			
			<h1 style="margin-left:20px;">Here is the full list of the controller classes for this project (for testing):</h1>
			<p style="margin-left:20px;">
				<g:each var="c" in="${grailsApplication.controllerClasses}">
                    ${c.fullName}<br />
              	</g:each>
             </p>
        </div>
    </body>
</html>