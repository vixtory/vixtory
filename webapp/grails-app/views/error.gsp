<html>
  <head>
	  <title><g:message code="error.runtimeException" /></title>
	  <style type="text/css">
	  		.message {
	  			border: 1px solid black;
	  			padding: 5px;
	  			background-color:#E9E9E9;
	  		}
	  		.stack {
	  			border: 1px solid black;
	  			padding: 5px;	  		
	  			overflow:auto;
	  			height: 300px;
	  		}
	  		.snippet {
	  			padding: 5px;
	  			background-color:white;
	  			border:1px solid black;
	  			margin:3px;
	  			font-family:courier;
	  		}
	  </style>
  </head>
  
  <body>
    <h1><g:message code="error.runtimeException" /></h1>
    <h2><g:message code="error.details" /></h2>
  	<div class="message">
  		<strong><g:message code="error.message" />:</strong> ${exception.message?.encodeAsHTML()} <br />
  		<strong><g:message code="error.caused" />:</strong> ${exception.cause?.message?.encodeAsHTML()} <br />
  		<strong><g:message code="error.class" />:</strong> ${exception.className} <br />  		  		
  		<strong><g:message code="error.atLine" />:</strong> [${exception.lineNumber}] <br />  		
  		<strong><g:message code="error.codeSnippet" />:</strong><br />   		
  		<div class="snippet">
  			<g:each var="cs" in="${exception.codeSnippet}"> 
  				${cs?.encodeAsHTML()}<br />  			
  			</g:each>  	
  		</div>	  		
  	</div>
    <h2><g:message code="error.stackTrace" /></h2>
    <div class="stack">
      <pre><g:each in="${exception.stackTraceLines}">${it.encodeAsHTML()}<br/></g:each></pre>
    </div>
  </body>
</html>