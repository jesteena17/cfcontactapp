<html>
     <head>
          <title>MYCONTACTS</title>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <meta charset="utf-8">
          <!---<meta name="viewport" content="width=device-width, initial-scale=1">--->
          <cfheader name="cache-control" value="no-cache, no-store, must-revalidate"> 
               <cfheader name="pragma" value="no-cache">
          <cfheader name="expires" value="#getHttpTimeString(now())#">
          <link type="image/png" sizes="64x64" rel="icon" href="images/logo.png">
          <link href="css/bootstrap.css" rel="stylesheet">
          <link href="css/all.css" rel="stylesheet">
          <link href="css/styles.css" rel="stylesheet"/>
          <script src="js/jquery-3.6.0.js"></script>
          <script src="js/jquery.validate.min.js"></script>
          <script src="js/bootstrap.bundle.min.js"></script>
          <script src="js/validations.js"></script>
     </head>
     <body>
          <cfoutput>
                <nav class="navbar navbar-expand-md navbar-dark bg-primary">
                    <a class="navbar-brand" href="index.cfm">
                         <img src="images/logo.png" width="25" height="25" />CONTACT BOOK
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapsibleNavbar">
                         <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="collapsibleNavbar">
                         <ul class="navbar-nav ml-auto">
                              <cflock timeout=20 scope="Session" type="readonly">    
                                   <cfif StructKeyExists(session.stLoggedInUser,"loggedin") AND session.stLoggedInUser.loggedin EQ false >
                                        <li  class="nav-item"><a class="nav-link" href="signup.cfm"><i class="fa fa-user"></i>Sign up</a></li><br>
                                        <li class="nav-item"><a class="nav-link" href="signin.cfm"><i class="fa-solid fa-right-to-bracket"></i>Login</a></li>
                                   <cfelseif StructKeyExists(session.stLoggedInUser, "username") AND session.stLoggedInUser.username NEQ "" AND 
                                        StructKeyExists(session.stLoggedInUser, "userrole") AND session.stLoggedInUser.userrole NEQ "">
                                        <li class="nav-item">
                                             <a class="nav-link">&nbsp;You are in! 
                                                  <cfif StructKeyExists(session.stLoggedInUser, "username") AND session.stLoggedInUser.username NEQ "" AND 
                                                       StructKeyExists(session.stLoggedInUser, "userrole") AND session.stLoggedInUser.userrole NEQ "">
                                                       #session.stLoggedInUser.username#(#session.stLoggedInUser.userrole#)
                                                  </cfif>
                                             </a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" href="logout.cfm"><i class="fa-solid fa-right-to-bracket"></i>Logout</a></li>
                                   </cfif>
                              </cflock>
                         </ul>
                    </div>
               </nav>
          </cfoutput>     
     </html>
</body>