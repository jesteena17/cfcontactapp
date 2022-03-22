<!Doctype html>
<html lang="en">
     <head>
          <cfinclude template="header.cfm">
            
     </head>
     <body>
          
               <div class="container-fluid">
                    <div class="col-md-8">
                         <div class="row m-5 no-gutters shadow-lg logindiv">
                              <div class="col-md-3 d-none d-md-block bg1 d-flex justify-content-center align-items-center logindivleft">
                                   <i class="fa-regular fa-address-book" style="color:white;vertical-align: middle;"></i>
                              </div>
                              <div class="col-md-9 bg-white p-5 logindivright">
                                   <h3 class="pb-3">Sign Up Form</h3>
                                   <div class="form-style">
                                        <form action="" method="post">
                                             <div class="form-group pb-3">
                                                  <input type="text" name="fullname" id="fullname" placeholder="Fullname" class="form-control-lg w-100"
                                                       aria-describedby="emailHelp">
                                             </div>
                                        
                                             <div class="form-group pb-3">
                                                  <input type="email"  name="emailid" id="emailid" placeholder="EmailID" class="form-control-lg w-100"
                                                       aria-describedby="emailHelp">
                                             </div>
                                        
                                             <div class="form-group pb-3">
                                                  <input type="text" name="username" id="username" placeholder="Username" class="form-control-lg w-100"
                                                       aria-describedby="emailHelp">
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" name="password" id="password" placeholder="Password" class="form-control-lg w-100"
                                                       >
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" name="cpassword" id="cpassword"  placeholder="Confirm Password" class="form-control-lg w-100"
                                                       >
                                             </div>
                                             <div class="pb-2">
                                                  <button type="submit"
                                                       class="btn btn-outline-primary w-100 font-weight-bold mt-2 form-control-lg">Submit</button>
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
          
     </body>

</html>
