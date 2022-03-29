<!Doctype html>
<html lang="en">
     <head>
          <cfinclude template="header.cfm">         
     </head>
     <body>
          <cfoutput>
               <div class="container d-flex justify-content-center align-items-center">
                    <div class="col-md-7">
                         <cfif IsDefined("url.message")>
                              <div class="col-md-12 alert alert-success">
                                   Successfully Registered
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
                                        <cfif StructKeyExists(form, "regsubmit")>
                                             <cfinvoke component="components.backend" method="validateregform" returnvariable="valresult"></cfinvoke>
                                             <cfif refind(':("[^"]+"|\d+|true|false)', serializeJSON(valresult)) EQ 0>
                                                  <cfinvoke component="components.backend" method="registration" returnvariable="result">
                                                       <cfinvokeargument name="fname" value="#form.fullname#" />
                                                       <cfinvokeargument name="email" value="#form.emailid#" />
                                                       <cfinvokeargument name="username" value="#form.username#" />
                                                       <cfinvokeargument name="password" value="#form.origpassword#" />
                                                       <cfinvokeargument name="cpassword" value="#form.confirm_password#" />
                                                       <cfinvokeargument name="userrole" value="#form.userrole#" />
                                                  </cfinvoke>
                                             <cfif result GT 0>
                                             <cflocation url = "signup.cfm?message=success" addtoken="no">
                                             </cfif>
                                             </cfif>
                                        </cfif>
                                   
                                        <form action="" id="signupForm" method="post" >
                                             <div class="form-group pb-3">
                                                  <input type="text" name="fullname" id="fullname" value="#form.fullname#" placeholder="Fullname" class="form-control-sm w-100"
                                                       aria-describedby="emailHelp">
                                                  <cfif isDefined("valresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#valresult.error1#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="email"  name="emailid" id="emailid" value="#form.emailid#" placeholder="EmailID" class="form-control-sm w-100"
                                                       aria-describedby="emailHelp">
                                                  <cfif isDefined("valresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#valresult.error2#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>                                     
                                             <div class="form-group pb-3">
                                                  <input type="text" name="username" id="username" value="#form.username#" placeholder="Username" class="form-control-sm w-100"
                                                       aria-describedby="emailHelp">
                                                  <cfif isDefined("valresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#valresult.error3#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" name="origpassword" id="origpassword" value="#form.origpassword#" placeholder="Password" class="form-control-sm w-100">
                                                  <cfif isDefined("valresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#valresult.error4#</span></b>
                                                       </p>
                                                  </cfif>
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" name="confirm_password" id="confirm_password" value="#form.confirm_password#"  placeholder="Confirm Password" class="form-control-sm w-100">
                                                  <cfif isDefined("valresult.error1")>
                                                       <p align="left">
                                                            <span class="sserrors">#valresult.error5#</span></b>
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
