<!Doctype html>
<html lang="en">
     <head>
          <cfinclude template="header.cfm">
               <link href="css/style.css" rel="stylesheet" />
     </head>
     <body>
        
               <div class="container-fluid">
                     <div class="col-md-12">
                         <div class="row m-5 no-gutters shadow-lg logindiv">
                              <div class="col-md-3 d-none d-md-block bg1 d-flex justify-content-center align-items-center logindivleft">
                                   <i class="fa-regular fa-address-book" style="color:white;vertical-align: middle;"></i>
                              </div>
                              <div class="col-md-6 bg-white p-5 logindivright">
                                   <h3 class="pb-3">Login Form</h3>
                                   <div class="form-style">
                                        <form>
                                             <div class="form-group pb-3">
                                                  <input type="email" placeholder="Email" class="form-control-lg w-100"
                                                       id="exampleInputEmail1" aria-describedby="emailHelp">
                                             </div>
                                             <div class="form-group pb-3">
                                                  <input type="password" placeholder="Password" class="form-control-lg w-100"
                                                       id="exampleInputPassword1">
                                             </div>
                                             <div class="d-flex align-items-center justify-content-between">


                                             </div>
                                             <div class="pb-2">
                                                  <button type="submit"
                                                       class="btn btn-outline-primary w-100 font-weight-bold mt-2 form-control-lg">Submit</button>
                                             </div>
                                        </form>
                                        <div class="sideline">OR Sign in Using</div>
                                        <div class="d-flex justify-content-center align-items-center">
                                             <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" width="50"
                                                  viewBox="0 0 506.86 506.86">

                                                  <title>facebook-round-color</title>
                                                  <path class="cls-1"
                                                       d="M506.86,253.43C506.86,113.46,393.39,0,253.43,0S0,113.46,0,253.43C0,379.92,92.68,484.77,213.83,503.78V326.69H149.48V253.43h64.35V197.6c0-63.52,37.84-98.6,95.72-98.6,27.73,0,56.73,5,56.73,5v62.36H334.33c-31.49,0-41.3,19.54-41.3,39.58v47.54h70.28l-11.23,73.26H293V503.78C414.18,484.77,506.86,379.92,506.86,253.43Z" />
                                                  <path class="cls-2"
                                                       d="M352.08,326.69l11.23-73.26H293V205.89c0-20,9.81-39.58,41.3-39.58h31.95V104s-29-5-56.73-5c-57.88,0-95.72,35.08-95.72,98.6v55.83H149.48v73.26h64.35V503.78a256.11,256.11,0,0,0,79.2,0V326.69Z" />
                                             </svg>&nbsp;&nbsp;
                                             <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" class="cls-3"
                                                  shape-rendering="geometricPrecision" text-rendering="geometricPrecision"
                                                  image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd"
                                                  viewBox="0 0 640 640">
                                                  <path
                                                       d="M320 0C143.234 0 0 143.234 0 320s143.234 320 320 320 320-143.234 320-320S496.766 0 320 0zm4.76 560.003C192.12 560.003 84.757 452.651 84.757 320c0-132.651 107.364-240.003 240.003-240.003 64.772 0 118.998 23.646 160.774 62.753l-65.115 62.764c-17.894-17.114-49.005-36.992-95.647-36.992C242.78 168.522 176.01 236.4 176.01 320c0 83.6 66.887 151.478 148.762 151.478 95.01 0 130.643-68.233 136.124-103.513l-136.136-.012v-82.241l226.633.012c1.996 12.012 3.768 24.012 3.768 39.768.118 137.116-91.761 234.523-230.353 234.523l-.047-.012z" />
                                             </svg>


                                        </div>
                                        <div class="pt-4 text-center">
                                             Don't have an account? <a href="signup.cfm">Sign Up</a>
                                        </div>
                                   </div>

                              </div>
                         </div>
                    </div>
               </div>
         
     </body>

</html>