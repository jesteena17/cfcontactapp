<!Doctype html>
<html lang="en">
     <head>
          <cfinclude template="header.cfm">         
     </head>
     <body>
          <cfoutput>
               <div class="container d-flex justify-content-center align-items-center">
                    <div class="col-md-7">
                         <cfif IsDefined("session.valreginsresult") and not session.valreginsresult EQ "" >
                               <div class="alert alert-success alert1 text-center">
                                   #session.valreginsresult#
                               </div>
                         </cfif>
                         <div class="row m-5 no-gutters shadow-lg logindiv">
                              <div class="col-md-4 d-none d-md-block bg1 logindivleft">
                                   <img src="images/logo.png" width="55" height="55" />
                              </div>
                              <div class="col-md-8 bg-white p-3 logindivright">
                                   <h3 class="pb-1">Sign Up Form</h3>
                                   <div class="form-style">
                                        <cfparam name="form.fullname" default="" >
                                        <cfparam name="form.emailid" default="" >
                                        <cfparam name="form.username" default="">
                                        <cfparam name="form.origpassword" default="">
                                        <cfparam name="form.confirm_password" default="">
                                        
                                        <form action="components/backend.cfc?method=registration" id="signupForm" method="post"  autocomplete="off">
                                             <div class="form-group pb-3">
                                                  <input type="text" name="fullname" id="fullname" value="<cfif isDefined('session.valregudata.fname')>#session.valregudata.fname#</cfif>" placeholder="Fullname" class="form-control-sm w-100"
                                                       aria-describedby="emailHelp">
                                                  <cfif isDefined("session.valregresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#session.valregresult.error1#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="email"  name="emailid" id="emailid" value="<cfif isDefined('session.valregudata.email')>#session.valregudata.email#</cfif>" placeholder="EmailID" class="form-control-sm w-100"
                                                       aria-describedby="emailHelp">
                                                       <span></span>
                                                  <cfif isDefined("session.valregresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#session.valregresult.error2#</span></b>
                                                       </p>
                                                  </cfif>

                                             </div>                                     
                                             <div class="form-group pb-3">
                                                  <input type="text" name="username" id="username" value="<cfif isDefined('session.valregudata.uname')>#session.valregudata.uname#</cfif>" placeholder="Username" class="form-control-sm w-100"
                                                       aria-describedby="emailHelp">
                                                       <span></span>
                                                  <cfif isDefined("session.valregresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#session.valregresult.error3#</span></b>
                                                       </p>
                                                  </cfif>
                                                  
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" name="origpassword" id="origpassword"  placeholder="Password" class="form-control-sm w-100">
                                                  <cfif isDefined("session.valregresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#session.valregresult.error4#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" name="confirm_password" id="confirm_password"   placeholder="Confirm Password" class="form-control-sm w-100">
                                                  <cfif isDefined("session.valregresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#session.valregresult.error5#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>
                                             <div class="pb-2">
                                             <input type="hidden" name="userrole" id="userrole" value="User" />
                                                  <input type="submit"
                                                       class="btn btn-outline-primary w-100 font-weight-bold mt-2 form-control-lg" id="regbtn" value="Sign Up" name="regsubmit"/>
                                             </div>
                                        </form>  
                                        <div class="pt-4 text-center">
                                             Already have an account? <a href="signin.cfm">Sign in</a>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
          </cfoutput>
     </body>

</html>
