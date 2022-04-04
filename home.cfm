<!Doctype html>
<html lang="en">
	<head>
		<cfset header = "header.cfm">
		<cfset content = "main.cfm">

		<!-- If we're attempting to view a specific page, load those templates instead -->
		<cfif IsDefined("url.view")>
			<cfset content = "#url.view#.cfm">
			<!-- In the case of an error we're just going to use the addcontact header as it only contains the back button! Cheeky! -->
			<cfif url.view eq "error">
				<cfset header = "header.cfm">
			<cfelse>
				<cfset header = "#url.view#.cfm">
			</cfif>
		</cfif>
          
         
	</head>
     <body>
    
     <cfoutput>
     <cfinclude template = #header#>
     
    <cfinclude template = #content#>
          </cfoutput>

	</body>
</html>