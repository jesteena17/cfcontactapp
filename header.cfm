<html>
     <head>
          <title>Bootstrap 5 Example</title>
          <meta charset="utf-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <meta charset="utf-8">
          <!---<meta name="viewport" content="width=device-width, initial-scale=1">--->
         
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
                    <div class="collapse navbar-collapse" id="collapsibleNavbar"><ul class="navbar-nav ml-auto">
                              <cfif  IsDefined("session.stLoggedInUser.loggedin")>
                                   <li  class="nav-item"><a class="nav-link" href="signup.cfm"><i class="fa fa-user"></i>Sign up</a></li><br>
                                   <li class="nav-item"><a class="nav-link" href="signin.cfm"><i class="fa-solid fa-right-to-bracket"></i>Login</a></li>
                              <cfelse>
                                  
                                        <li class="nav-item"><a class="nav-link" href="logout.cfm"><i class="fa-solid fa-right-to-bracket"></i>Logout</a></li>

                              </cfif>
                         </ul>
                    </div>
               </nav>
          </cfoutput>     
     </html>
</body>