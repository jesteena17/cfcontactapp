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
                         <div class="card-body d-flex justify-content-end align-items-center">
                              <a><svg class="svg1" width="20px" height="20px" viewBox="-64 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zM332.1 128H256V51.9l76.1 76.1zM48 464V48h160v104c0 13.3 10.7 24 24 24h104v288H48zm250.2-143.7c-12.2-12-47-8.7-64.4-6.5-17.2-10.5-28.7-25-36.8-46.3 3.9-16.1 10.1-40.6 5.4-56-4.2-26.2-37.8-23.6-42.6-5.9-4.4 16.1-.4 38.5 7 67.1-10 23.9-24.9 56-35.4 74.4-20 10.3-47 26.2-51 46.2-3.3 15.8 26 55.2 76.1-31.2 22.4-7.4 46.8-16.5 68.4-20.1 18.9 10.2 41 17 55.8 17 25.5 0 28-28.2 17.5-38.7zm-198.1 77.8c5.1-13.7 24.5-29.5 30.4-35-19 30.3-30.4 35.7-30.4 35zm81.6-190.6c7.4 0 6.7 32.1 1.8 40.8-4.4-13.9-4.3-40.8-1.8-40.8zm-24.4 136.6c9.7-16.9 18-37 24.7-54.7 8.3 15.1 18.9 27.2 30.1 35.5-20.8 4.3-38.9 13.1-54.8 19.2zm131.6-5s-5 6-37.3-7.8c35.1-2.6 40.9 5.4 37.3 7.8z"/></svg></a>
                              <a class="pl-2"><svg class="svg2" width="25px" height="23px" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M 6 3 L 6 29 L 26 29 L 26 9.5996094 L 25.699219 9.3007812 L 19.699219 3.3007812 L 19.400391 3 L 6 3 z M 8 5 L 18 5 L 18 11 L 24 11 L 24 27 L 8 27 L 8 5 z M 20 6.4003906 L 22.599609 9 L 20 9 L 20 6.4003906 z M 11 13 L 14.800781 18.5 L 11 24 L 13.400391 24 L 16 20.199219 L 18.599609 24 L 21 24 L 17.199219 18.5 L 21 13 L 18.599609 13 L 16 16.800781 L 13.400391 13 L 11 13 z"/></svg></a>
                               <a class="pl-2"><svg id="Layer_1"   width="20" height="20" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 114.81"><title>printer</title><path d="M18.46,89.86H7.82A7.8,7.8,0,0,1,2.3,87.57l-.24-.26A7.82,7.82,0,0,1,0,82V35.44a7.81,7.81,0,0,1,2.3-5.53l.25-.23a7.77,7.77,0,0,1,5.27-2.06H20.13A8.07,8.07,0,0,1,20,26.14v-18a8.05,8.05,0,0,1,2.39-5.72h0A8.07,8.07,0,0,1,28.1,0H94.78a8.13,8.13,0,0,1,8.11,8.11v18a8.07,8.07,0,0,1-.14,1.48h12.31a7.81,7.81,0,0,1,5.51,2.29h0a7.8,7.8,0,0,1,2.3,5.52V82a7.84,7.84,0,0,1-7.82,7.82H104.42v20.31a4.63,4.63,0,0,1-1.36,3.28,4.32,4.32,0,0,1-.39.34,4.6,4.6,0,0,1-2.89,1H23.1a4.63,4.63,0,0,1-3.28-1.36,3.06,3.06,0,0,1-.34-.39,4.6,4.6,0,0,1-1-2.89V89.86ZM27,27.62H95.91l.19-.17a1.86,1.86,0,0,0,.55-1.31v-18a1.88,1.88,0,0,0-1.87-1.87H28.1a1.87,1.87,0,0,0-1.32.55h0a1.87,1.87,0,0,0-.54,1.32v18a1.84,1.84,0,0,0,.55,1.31l.19.17Zm9.3,71.71a2.4,2.4,0,0,1,0-4.8H63.64a2.4,2.4,0,0,1,0,4.8Zm0-14.56a2.4,2.4,0,0,1,0-4.8H86.61a2.4,2.4,0,0,1,0,4.8ZM7.07,60.61H115.81V35.44a.76.76,0,0,0-.22-.54.77.77,0,0,0-.53-.22H7.82a.76.76,0,0,0-.46.16l-.07.07a.76.76,0,0,0-.22.53V60.61Zm108.74,7.07H102.19a4.13,4.13,0,0,1,.87.69,4.63,4.63,0,0,1,1.36,3.28V82.79h10.64a.75.75,0,0,0,.53-.22.79.79,0,0,0,.22-.53V67.68Zm-95.12,0H7.07V82a.81.81,0,0,0,.15.46l.07.07a.75.75,0,0,0,.53.22H18.46V71.65a4.63,4.63,0,0,1,1.36-3.28,4.13,4.13,0,0,1,.87-.69Zm76.67,4.23H25.52v35.83H97.36V71.91Z"/></svg></a>
                         </div>
                    </div>
                    <div class="row mt-3" >
                         <div class="col-md-12">
                              <div class="row">
                                   <div class="col-md-3 ">
                                        <div class="card ">
                                             <div class="avatar-upload mt-3 mb-3">
                                                  <div class="avatar-edit">
                                                       <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                                                       <label for="imageUpload" class=" d-flex justify-content-center align-items-center"><i class="fa fa-edit colr1"></i></label>
                                                  </div>
                                                  <div class="avatar-preview">
                                                       <div id="imagePreview" style="background-image: url('images/user1.png');">
                                                       </div>
                                                  </div>
                                                  <div class="dashboard-avatar-text d-flex flex-column justify-content-end align-items-center pt-3 pb-0">
										      <span class="txtcolr">Zivara Technoloty</span> 
                                                        <span class="mt-2">
                                                            <a type="button" class="btn btn-primary btn-sm rounded-pill px-3" data-toggle="modal" data-target="##staticBackdrop">Create New Contact</a>
                                                        </span> 
									     </div>
                                             </div>
                                        </div>
                                   </div>
                                   <div class="col-md-9">
                                        <div class="card">
                                             <div class="card-body d-flex justify-content-start align-items-center">
                                                  <table>
                                                       <tr class="txtcolr">
                                                            <th>PHOTO</th>
                                                            <th >NAME</th>
                                                            <th >EMAIL ID</th>
                                                            <th >PHONE NUMBER</th>
                                                            <th colspan="4">ACTIONS</th>
                                                       </tr>
                                                       <tr>
                                                           <div class="modal" tabindex="-1">
 
                                                       </tr>
                                                  </table>
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>

               </div> 
               <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered  modal-lg">
                         <div class=" ml-3">
                             
                                   <div class="col-md-12">
                                        <div class="row">
                                             <div class="col-md-9 bgwhites">
                                                  
                                                  <div class="controls">
                                                       <div class="row">
                                                            <div class="col-sm-4">
                                                                 <div class="form-group">
                                                                 <label for="form_name">Title *</label>
                                                                 <input id="form_name" type="text" name="surname" class="form-control" placeholder="Please enter your name *" required="required" data-error="name is required.">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                 <div class="form-group">
                                                                 <label for="form_email">Firstname *</label>
                                                                 <input id="form_email" type="email" name="email" class="form-control" placeholder="Please enter your email *" required="required" data-error="Valid email is required.">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                            </div>
                                                            <div class="col-sm-4">
                                                                 <div class="form-group">
                                                                 <label for="form_phone">Lastname *</label>
                                                                 <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone number">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                            </div>
                                                       </div>
                                                  </div>
                                                  <div class="clearfix"></div>

                                                  <div class="row">
                                                       <div class="col-md-6">
                                                            <div class="form-group">
                                                                 <label for="form_phone">Gender *</label>
                                                                 <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone number">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                       </div>
                                                       <div class="col-md-6">
                                                            <div class="form-group">
                                                                 <label for="form_phone">Date Of Birth *</label>
                                                                 <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone number">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                       </div>
                                                  </div>
                                                  <div class="clearfix"></div>

                                                  <div class="row">
                                                       <div class="col-md-12">
                                                            <div class="form-group">
                                                                 <label for="form_phone">Upload Photo *</label>
                                                                 <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone number">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                       </div>
                                                       
                                                  </div>
                                                  <div class="clearfix"></div>

                                                  <div class="row">
                                                       <div class="col-md-6">
                                                            <div class="form-group">
                                                                 <label for="form_phone">Gender *</label>
                                                                 <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone number">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                       </div>
                                                       <div class="col-md-6">
                                                            <div class="form-group">
                                                                 <label for="form_phone">Date Of Birth *</label>
                                                                 <input id="form_phone" type="tel" name="phone" class="form-control" placeholder="Please enter your phone number">
                                                                 <div class="help-block with-errors"></div>
                                                                 </div>
                                                       </div>
                                                  </div>
                                                  <div class="modal-footer">
                                                       <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                                                       <button type="button" class="btn btn-primary  btn-sm">SAVE</button>
                                                  </div>
                                             
                                             </div>
                                             <div class="col-md-3" >
                                                  <div class="mrsp">
                                                       <img src="images/avt1.png" width="150" height="130" />
                                                  </div>
                                             </div>
                                        </div>
                              
                                   </div>
                             
                          
                         </div>
                    </div>
               </div>  
               
          </cfoutput>




<script type="text/javascript">
    $(window).on('load', function() {
        $('.modal').modal('show');
    });
</script>
     <script>
  
          function readURL(input) {
               if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                         $('#imagePreview').css('background-image', 'url('+e.target.result +')');
                         $('#imagePreview').hide();
                         $('#imagePreview').fadeIn(650);
                    }
                    reader.readAsDataURL(input.files[0]);
               }
               }
               $("#imageUpload").change(function() {
               readURL(this);
               });
     </script>

	</body>
</html>



 <meta name="description" content="Login Page">
          <meta name="author" content="SitePoint">
          <meta http-equiv="cache-control" content="max-age=0" />
          <meta http-equiv="cache-control" content="no-cache" />
          <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
          <meta http-equiv="expires" content="0" />
          <meta http-equiv="pragma" content="no-cache" />
          <cfheader name="cache-control" value="no-cache, no-store, must-revalidate"> 
          <cfheader name="pragma" value="no-cache">
          <cfheader name="expires" value="#getHttpTimeString(now())#">




           data-toggle="modal" data-target="##exampleModal"

            <li class="nav-item">
                                             <a class="nav-link">&nbsp;You are in! 
                                                  #session.stLoggedInUser.username#(#session.stLoggedInUser.userrole#)
                                             </a>
                                        </li>





                                        $.ajax({
	        type: "GET", //we are using GET method to get data from server side
	        url: 'get.php', // get the route value
	        data: {employee_id:employeeId}, //set data
	        beforeSend: function () {//We add this before send to disable the button once we submit it so that we prevent the multiple click
	            
	        },
	        success: function (response) {//once the request successfully process to the server side it will return result here
	            response = JSON.parse(response);
	            $("#edit-form [name=\"id\"]").val(response.id);
	            $("#edit-form [name=\"email\"]").val(response.email);
	            $("#edit-form [name=\"first_name\"]").val(response.first_name);
	            $("#edit-form [name=\"last_name\"]").val(response.last_name);
	            $("#edit-form [name=\"address\"]").val(response.address);
	        }
	    });
	});

       <cfset variables.output=serializeJson(getcontactbyid,"struct") />


       <cfdocument format="PDF" filename="contacts.pdf"  overwrite="Yes">
<html>
<head>
    <title>Hello World</title>
</head>
<body>   
<cfinvoke component="components.backend" method="displayalldata" returnvariable="allcontacts"></cfinvoke>
<cfoutput> 
     <table class="table table-responsive w-auto">
          <tr class="txtcolr">
               <th >PHOTO</th>
               <th >NAME</th>
               <th >EMAIL ID</th>
               <th >PHONE NUMBER</th>
               <th colspan="3" class="text-center">ACTIONS</th>
          </tr>
          <cfloop QUERY="allcontacts">
               <tr>
                   
                    <td>#allcontacts.firstname#</td>
                    <td>#allcontacts.email#</td>
                    <td>#allcontacts.mobile#</td>
                        
               </tr>
          </cfloop>
     </table>

</cfoutput> 
</body>
</html>
</cfdocument>
<cfheader name="Content-Disposition" value="attachment;filename=contacts.pdf">
<cfcontent type="application/octet-stream" file="#expandPath('.')#\contacts.pdf" deletefile="Yes">






        function PrintDocument() {
            //Hide print button
               var printContent = document.getElementById("employee");
            //Hide second child i.e second column Header
            $("#employee th:nth-child(2)").hide()

            //Hide second child i.e second column
            $("#employee td:nth-child(2)").hide()
var WinPrint = window.open('', '', 'width=900,height=650');

          

            //Or hide column using single line
            //$(".employee th:nth-child(2), .employee td:nth-child(2)").hide();

            // Open Print  Preview mode to print
          WinPrint.document.write(printContent.innerHTML);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
            //window.print();

            //show print button again
           

            //Or show hidden columns again
            $("#employee th:nth-child(2)").show();
            $("#employee td:nth-child(2)").show();

            //Or show hidden column using single line
            //$(".employee th:nth-child(2), .employee td:nth-child(2)").show();
        }   

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
 <a href="javascript:void(0);" onclick="PrintDocument()">Print</a>


 https://www.webcodeexpert.com/2020/04/jquery-to-hide-first-last-or-nth-column.html

 https://code-boxx.com/print-page-javascript/




 <html>
<head>
    <title></title>
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <table id="employee">
        <tr>
            <th>First Name</th>
            <th>Middle Name</th>
            <th>Last Name</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Jatin</td>
            <td>Kumar</td>
            <td>Verma</td>
            <td>23</td>
        </tr>
        <tr>
            <td>Sandeep</td>
            <td>Singh</td>
            <td>Dangi</td>
            <td>33</td>
        </tr>
        <tr>
            <td>Aman</td>
            <td>Pal</td>
            <td>Singh</td>
            <td>27</td>
        </tr>
    </table>
    <br />
     <a href="javascript:void(0);" onclick="PrintDocument()">Print</a>
  
  <script>
    function PrintDocument() {
       $("#employee th:nth-child(2)").hide();

            //Hide second child i.e second column
            $("#employee td:nth-child(2)").hide();
            //Hide print button
               var divToPrint  = document.getElementById("employee");
      
      newWin = window.open("");
        newWin.document.write(divToPrint.outerHTML);
        newWin.print();
        newWin.close()
      
            //Hide second child i.e second column Header
           
//var WinPrint = window.open('', '', 'width=900,height=650');

          

            //Or hide column using single line
            //$(".employee th:nth-child(2), .employee td:nth-child(2)").hide();

            // Open Print  Preview mode to print
         // WinPrint.document.write(printContent.innerHTML);
    // WinPrint.document.close();
    // WinPrint.focus();
    // WinPrint.print();
    // WinPrint.close();
            //window.print();

            //show print button again
           

            //Or show hidden columns again
            $("#employee th:nth-child(2)").show();
            $("#employee td:nth-child(2)").show();

            //Or show hidden column using single line
            //$(".employee th:nth-child(2), .employee td:nth-child(2)").show();
        }   

  </script>
  
</body>

</html>


<cfset getcontacts = ORMExecuteQuery("from contacts where userid="&usersid)> 

download pdf

https://community.adobe.com/t5/coldfusion-discussions/create-pdf-and-force-download-it/m-p/2367581




   <a class="pl-2" href="javascript:void(0);" onclick="PrintDocument()" ><svg id="Layer_1"   width="20" height="20" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 114.81"><title>printer</title><path d="M18.46,89.86H7.82A7.8,7.8,0,0,1,2.3,87.57l-.24-.26A7.82,7.82,0,0,1,0,82V35.44a7.81,7.81,0,0,1,2.3-5.53l.25-.23a7.77,7.77,0,0,1,5.27-2.06H20.13A8.07,8.07,0,0,1,20,26.14v-18a8.05,8.05,0,0,1,2.39-5.72h0A8.07,8.07,0,0,1,28.1,0H94.78a8.13,8.13,0,0,1,8.11,8.11v18a8.07,8.07,0,0,1-.14,1.48h12.31a7.81,7.81,0,0,1,5.51,2.29h0a7.8,7.8,0,0,1,2.3,5.52V82a7.84,7.84,0,0,1-7.82,7.82H104.42v20.31a4.63,4.63,0,0,1-1.36,3.28,4.32,4.32,0,0,1-.39.34,4.6,4.6,0,0,1-2.89,1H23.1a4.63,4.63,0,0,1-3.28-1.36,3.06,3.06,0,0,1-.34-.39,4.6,4.6,0,0,1-1-2.89V89.86ZM27,27.62H95.91l.19-.17a1.86,1.86,0,0,0,.55-1.31v-18a1.88,1.88,0,0,0-1.87-1.87H28.1a1.87,1.87,0,0,0-1.32.55h0a1.87,1.87,0,0,0-.54,1.32v18a1.84,1.84,0,0,0,.55,1.31l.19.17Zm9.3,71.71a2.4,2.4,0,0,1,0-4.8H63.64a2.4,2.4,0,0,1,0,4.8Zm0-14.56a2.4,2.4,0,0,1,0-4.8H86.61a2.4,2.4,0,0,1,0,4.8ZM7.07,60.61H115.81V35.44a.76.76,0,0,0-.22-.54.77.77,0,0,0-.53-.22H7.82a.76.76,0,0,0-.46.16l-.07.07a.76.76,0,0,0-.22.53V60.61Zm108.74,7.07H102.19a4.13,4.13,0,0,1,.87.69,4.63,4.63,0,0,1,1.36,3.28V82.79h10.64a.75.75,0,0,0,.53-.22.79.79,0,0,0,.22-.53V67.68Zm-95.12,0H7.07V82a.81.81,0,0,0,.15.46l.07.07a.75.75,0,0,0,.53.22H18.46V71.65a4.63,4.63,0,0,1,1.36-3.28,4.13,4.13,0,0,1,.87-.69Zm76.67,4.23H25.52v35.83H97.36V71.91Z"/></svg></a>
               

               <cfset variables.getNumberOfRecords = listLen(mypupdateResult.RecordCount)> 
               <cfif variables.getNumberOfRecords GT 0>
                    <cfquery name = "local.selectpic" >
                         select profilepic from  register 
                         where regid= <cfqueryparam value = "#arguments.uid#" cfsqltype = "cf_sql_integer" >
                    </cfquery>
               </cfif>