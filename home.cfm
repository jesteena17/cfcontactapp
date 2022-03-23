<!Doctype html>
<html lang="en">
	<head>
		<cfinclude template="header.cfm" >
	</head>
     <body>
          <cfif session.stLoggedInUser.loggedin EQ false >
               <cflocation URL="logout.cfm" addtoken="no">
          </cfif>
          <cfoutput>
               <div class="container mt-3">
                    <div class="card">
                         <div class="card-body">
                              This is some text within a card body.
                         </div>
                    </div>
               </div>   
          </cfoutput>
	</body>
</html>