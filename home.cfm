<!Doctype html>
<html lang="en">
	<head>
		<cfset header = "header.cfm">
		<cfset content = "main.cfm">
		<cfif IsDefined("url.view")>
			<cfset content = "#url.view#.cfm">
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