
<cfif StructKeyExists(session.stLoggedInUser,"loggedin") AND session.stLoggedInUser.loggedin EQ true and  StructKeyExists(session.stLoggedInUser,"userID")>
     <cfset variables.user_id=session.stLoggedInUser.userID />
     <cfelse>
     <cfset variables.user_id=0 />
</cfif>
<cfoutput>
     <cfset UserObj=CreateObject("component","components.backend")/>
     <cfset alldetails=UserObj.displayreguserdata(variables.user_id)/>
     <cfset ContactObj=CreateObject("component","components.backend")/>
     <cfset allcontacts=ContactObj.displayalldata(variables.user_id)/>
     <div class="container mt-3">
          <div class="card">
               <div class="card-body mycardbody d-flex justify-content-between align-items-center">
                    <span class="col-sm-12 text-center col-md-4 alert alert-primary myalert">
                         You have got [#arraylen(allcontacts)#] Contacts Saved! 
                    </span>
                    <span class="col-sm-12 col-md-8 d-flex justify-content-end align-items-center">
                         <cfif arraylen(allcontacts) GTE 1>
                              <a href="printPDF.cfm" download="Contacts.pdf"><svg class="svg1" width="20px" height="20px" viewBox="-64 0 512 512" xmlns="http://www.w3.org/2000/svg"><path d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zM332.1 128H256V51.9l76.1 76.1zM48 464V48h160v104c0 13.3 10.7 24 24 24h104v288H48zm250.2-143.7c-12.2-12-47-8.7-64.4-6.5-17.2-10.5-28.7-25-36.8-46.3 3.9-16.1 10.1-40.6 5.4-56-4.2-26.2-37.8-23.6-42.6-5.9-4.4 16.1-.4 38.5 7 67.1-10 23.9-24.9 56-35.4 74.4-20 10.3-47 26.2-51 46.2-3.3 15.8 26 55.2 76.1-31.2 22.4-7.4 46.8-16.5 68.4-20.1 18.9 10.2 41 17 55.8 17 25.5 0 28-28.2 17.5-38.7zm-198.1 77.8c5.1-13.7 24.5-29.5 30.4-35-19 30.3-30.4 35.7-30.4 35zm81.6-190.6c7.4 0 6.7 32.1 1.8 40.8-4.4-13.9-4.3-40.8-1.8-40.8zm-24.4 136.6c9.7-16.9 18-37 24.7-54.7 8.3 15.1 18.9 27.2 30.1 35.5-20.8 4.3-38.9 13.1-54.8 19.2zm131.6-5s-5 6-37.3-7.8c35.1-2.6 40.9 5.4 37.3 7.8z"/></svg></a>
                              <a href="printExcel.cfm"  class="pl-2"><svg class="svg2" width="25px" height="23px" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg"><path d="M 6 3 L 6 29 L 26 29 L 26 9.5996094 L 25.699219 9.3007812 L 19.699219 3.3007812 L 19.400391 3 L 6 3 z M 8 5 L 18 5 L 18 11 L 24 11 L 24 27 L 8 27 L 8 5 z M 20 6.4003906 L 22.599609 9 L 20 9 L 20 6.4003906 z M 11 13 L 14.800781 18.5 L 11 24 L 13.400391 24 L 16 20.199219 L 18.599609 24 L 21 24 L 17.199219 18.5 L 21 13 L 18.599609 13 L 16 16.800781 L 13.400391 13 L 11 13 z"/></svg></a>
                              <a class="pl-2" href="printPrint.cfm"  ><svg id="Layer_1"   width="20" height="20" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 114.81"><title>printer</title><path d="M18.46,89.86H7.82A7.8,7.8,0,0,1,2.3,87.57l-.24-.26A7.82,7.82,0,0,1,0,82V35.44a7.81,7.81,0,0,1,2.3-5.53l.25-.23a7.77,7.77,0,0,1,5.27-2.06H20.13A8.07,8.07,0,0,1,20,26.14v-18a8.05,8.05,0,0,1,2.39-5.72h0A8.07,8.07,0,0,1,28.1,0H94.78a8.13,8.13,0,0,1,8.11,8.11v18a8.07,8.07,0,0,1-.14,1.48h12.31a7.81,7.81,0,0,1,5.51,2.29h0a7.8,7.8,0,0,1,2.3,5.52V82a7.84,7.84,0,0,1-7.82,7.82H104.42v20.31a4.63,4.63,0,0,1-1.36,3.28,4.32,4.32,0,0,1-.39.34,4.6,4.6,0,0,1-2.89,1H23.1a4.63,4.63,0,0,1-3.28-1.36,3.06,3.06,0,0,1-.34-.39,4.6,4.6,0,0,1-1-2.89V89.86ZM27,27.62H95.91l.19-.17a1.86,1.86,0,0,0,.55-1.31v-18a1.88,1.88,0,0,0-1.87-1.87H28.1a1.87,1.87,0,0,0-1.32.55h0a1.87,1.87,0,0,0-.54,1.32v18a1.84,1.84,0,0,0,.55,1.31l.19.17Zm9.3,71.71a2.4,2.4,0,0,1,0-4.8H63.64a2.4,2.4,0,0,1,0,4.8Zm0-14.56a2.4,2.4,0,0,1,0-4.8H86.61a2.4,2.4,0,0,1,0,4.8ZM7.07,60.61H115.81V35.44a.76.76,0,0,0-.22-.54.77.77,0,0,0-.53-.22H7.82a.76.76,0,0,0-.46.16l-.07.07a.76.76,0,0,0-.22.53V60.61Zm108.74,7.07H102.19a4.13,4.13,0,0,1,.87.69,4.63,4.63,0,0,1,1.36,3.28V82.79h10.64a.75.75,0,0,0,.53-.22.79.79,0,0,0,.22-.53V67.68Zm-95.12,0H7.07V82a.81.81,0,0,0,.15.46l.07.07a.75.75,0,0,0,.53.22H18.46V71.65a4.63,4.63,0,0,1,1.36-3.28,4.13,4.13,0,0,1,.87-.69Zm76.67,4.23H25.52v35.83H97.36V71.91Z"/></svg></a>
                         </cfif>
                    </span>
               </div>
          </div>
          <div class="row mt-3" >
               <div class="col-md-12 col-xs-12">
                    <div class="row">
                         <div class="col-md-3">
                              <div class="card ">
                                   <div class="avatar-upload mt-3 mb-3">
                                        <form action="" id="form1" enctype="multipart/form-data" method="post">
                                             <div class="avatar-edit">
                                                  <input type="file" name="imageUpload" id="imageUpload" accept=".png, .jpg, .jpeg" />
                                                  <input type="hidden" name="picuserid" id="picuserid"  value="#variables.user_id#" />
                                                  <label for="imageUpload" class=" d-flex justify-content-center align-items-center"><i class="fa fa-edit colr1"></i></label>
                                             </div>
                                             <div class="avatar-preview">
                                                  <cfif alldetails.profilepic EQ "" OR alldetails.profilepic EQ "null">
                                                       <div id="imagePreview" style="background-image: url('images/user1.png');">
                                                       </div>
                                                  <cfelse>
                                                       <div id="imagePreview" style="background-image: url('profilepics/#alldetails.profilepic#');">
                                                       </div>
                                                  </cfif>
                                             </div>
                                        </form>
                                        <div class="dashboard-avatar-text d-flex flex-column justify-content-end align-items-center pt-3 pb-0">
                                                  <span class="txtcolr">#alldetails.fullname#</span> 
                                                  <span class="mt-2">
                                                  <a class="btn btn-primary btn-sm rounded-pill px-3" id="addEventBtn" data-toggle="modal" data-target="##exampleModal">Create New Contact</a>
                                                  </span> 
                                        </div>
                                   </div>
                              </div>
                         </div> 
                         <div class="col-md-9 col-xs-9">
                              <div id="updatemsgdiv" class="hideme"></div>
                              <div id="addmsgdiv" class="hideme"></div>
                              <div class="card">
                                   <div class="card-body">
                                        <table width="100%" class="table table-responsive mytable" >
                                             <tr class="txtcolr">
                                                  <th >PHOTO</th>
                                                  <th >NAME</th>
                                                  <th >EMAIL ID</th>
                                                  <th >PHONE NUMBER</th>
                                                  <th colspan="3" class="text-center">ACTIONS </th>
                                             </tr>
                                             <cfif arraylen(allcontacts) GTE 1>
                                                  <cfloop array="#allcontacts#" item="allcontacts">
                                                       <tr>
                                                            <td>
                                                                 <cfif allcontacts.getPhoto() EQ "noimage.png">
                                                                      <img src="./images/#allcontacts.getPhoto()#" class="img-fluid" width="100" height="100"/>
                                                                 <cfelse>
                                                                      <img src="./contactimgs/#allcontacts.getPhoto()#" class="img-fluid" width="100" height="100"/>
                                                                 </cfif>
                                                            </td>
                                                            <td>#allcontacts.getTitle()&'.'&allcontacts.getFirstname()&' '&allcontacts.getLastname()#</td>
                                                            <td>#allcontacts.getEmail()#</td>
                                                            <td>#allcontacts.getMobile()#</td>
                                                            <td>
                                                                 <a class="btn btn btn-outline-primary btn-sm rounded-pill px-3 editbtn" data-conid="#allcontacts.getCid()#" id="editbtn"  data-toggle="modal" data-target="##exampleModal">
                                                                      Edit
                                                                 </a>
                                                            </td>
                                                            <td>
                                                                 <form method="post" action="components/backend.cfc?method=deletecontact">
                                                                 <input type="hidden" name="cid" value="#allcontacts.getCid()#"/>
                                                                      <input type="submit" class="btn btn btn-outline-primary btn-sm rounded-pill px-3" value="Delete"/>
                                                                 </form>
                                                            </td>
                                                            <td>
                                                                 <a class="btn btn btn-outline-primary btn-sm rounded-pill px-3 viewbtn" id="viewbtn" data-conid="#allcontacts.getCid()#" data-toggle="modal" data-target="##ViewModal">
                                                                      View
                                                                 </a>
                                                            </td>
                                                       </tr>
                                                  </cfloop>
                                             <cfelse>
                                                  <tr><td colspan="8">No Contacts Found Yet !</td></tr>
                                             </cfif>
                                        </table>
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
     </div> 
     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered  modal-lg">
               <div class="modal-content ml-3 ht">
                    <cfparam name="form.firstname" default="">
                    <cfparam name="form.lastname" default="">
                    <cfparam name="form.title" default="">
                    <cfparam name="form.gender" default="">
                    <cfparam name="form.dob" default="">
                    <cfparam name="form.email" default="">
                    <cfparam name="form.phone" default="">
                    <cfparam name="form.FiletoUpload" default="">
                    <cfparam name="form.address" default="">
                    <cfparam name="form.street" default=""> 
                    <cfparam name="form.pincode" default=""> 
                    <cfparam name="form.userid" default=""> 
                    <div class="col-md-12 col-xs-12 createcls">
                         <div class="row">
                              <div class="col-md-9 bgwhites formstyle1 pt-3 pl-5 pr-5 pb-3 ht">
                                   <form id="addcontactform" action="components/store.cfc?method=storecontactinfo" method="post" name="addcontactform" enctype="multipart/form-data">
                                        <div class="cformhead">
                                             <h4 id="modheading">CREATE  CONTACT</h4>
                                        </div>
                                        <div class="mt-3 percon">
                                             <h5>Personal Contact</h5>
                                             <hr class="hr">
                                        </div>
                                        <div class="controls">
                                             <div class="row">
                                                  <div class="col-sm-4">
                                                       <div class="form-group">
                                                            <label class="colr1" id="titlelab" for="title">Title *</label><br>
                                                            <select name="title" class="addfiledsel"  id="title">
                                                                 <option value=""></option>
                                                                 <option value="Mr">Mr.</option>
                                                                 <option value="Mrs">Mrs.</option>
                                                                 <option value="Ms">Ms.</option>
                                                            </select>
                                                            <cfif isDefined("session.valconresult.error1")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error1#</span></b>
                                                            </p>
                                                       </cfif>
                                                       </div>
                                                  </div>
                                                  <div class="col-sm-4">
                                                       <div class="form-group">
                                                            <label class="colr1" for="form_email">Firstname *</label>
                                                            <input id="firstname" type="text"  name="firstname" value="<cfif isDefined('session.valcondata.firstname')>#session.valcondata.firstname#</cfif>" class="form-control addfileds" placeholder="Your Firstname">
                                                            <cfif isDefined("session.valconresult.error2")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error2#</span></b>
                                                            </p>
                                                       </cfif>
                                                       </div>
                                                  </div>
                                                  <div class="col-sm-4">
                                                       <div class="form-group">
                                                            <label class="colr1" for="form_phone">Lastname *</label>
                                                            <input id="lastname"  type="text" name="lastname" value="<cfif isDefined('session.valcondata.lastname')>#session.valcondata.lastname#</cfif>"  class="form-control addfileds" placeholder="Your Lastname">
                                                            <cfif isDefined("session.valconresult.error3")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error3#</span></b>
                                                            </p>
                                                       </cfif>
                                                       </div>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="row">
                                             <div class="col-md-6">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone">Gender *</label><br>
                                                       <select name="gender" id="gender" class="addfiledsel" >
                                                            <option value=""></option>
                                                            <option value="Male"  >Male</option>
                                                            <option value="Female" >Female</option>
                                                       </select>
                                                       <cfif isDefined("session.valconresult.error4")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error4#</span></b>
                                                            </p>
                                                       </cfif>
                                                  </div>
                                             </div>
                                             <div class="col-md-6">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone">Date Of Birth *</label>
                                                       <input id="dob" type="date"  name="dob" class="form-control addfileds" >
                                                       <cfif isDefined("session.valconresult.error5")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error5#</span></b>
                                                            </p>
                                                       </cfif>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="row">
                                             <div class="col-md-6">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone">Email *</label><br>
                                                       <input id="email" type="email"  name="email" value="<cfif isDefined('session.valcondata.email')>#session.valcondata.email#</cfif>" class="form-control addfileds" placeholder="Your Email">
                                                       <cfif isDefined("session.valconresult.error6")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error6#</span></b>
                                                            </p>
                                                       </cfif>
                                                  </div>
                                             </div>
                                             <div class="col-md-6">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone">Phone *</label>
                                                       <input id="phone" type="tel" name="phone"  value="<cfif isDefined('session.valcondata.phone')>#session.valcondata.phone#</cfif>"  class="form-control addfileds" placeholder="Your Phone" >
                                                       <cfif isDefined("session.valconresult.error")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error7#</span></b>
                                                            </p>
                                                       </cfif>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="row">
                                             <div class="col-md-12">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone">Upload Photo *</label>
                                                       <input  type="file" name="FiletoUpload" id="FiletoUpload" class="form-control addfileds" >
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="mt-3 percon">
                                             <h5>Contact Details</h5>
                                             <hr class="hr">
                                        </div>
                                        <div class="row">
                                             <div class="col-md-4">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone">Address *</label>
                                                       <input id="address" type="text" name="address"  value="<cfif isDefined('session.valcondata.address')>#session.valcondata.address#</cfif>" class="form-control addfileds" placeholder="Your Address">
                                                       <cfif isDefined("session.valconresult.error8")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error8#</span></b>
                                                            </p>
                                                       </cfif>
                                                  </div>
                                             </div>
                                             <div class="col-md-4">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone"> Street *</label>
                                                       <input id="street" type="text" name="street"  value="<cfif isDefined('session.valcondata.street')>#session.valcondata.street#</cfif>" class="form-control addfileds" placeholder="Your Street">
                                                       <cfif isDefined("session.valconresult.error9")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error9#</span></b>
                                                            </p>
                                                       </cfif>     
                                                  </div>
                                             </div>
                                             <div class="col-md-4">
                                                  <div class="form-group">
                                                       <label class="colr1" for="form_phone"> Pincode *</label>
                                                       <input id="pincode" type="text" name="pincode"  value="<cfif isDefined('session.valcondata.pincode')>#session.valcondata.pincode#</cfif>" class="form-control addfileds" placeholder="Your Pincode">
                                                       <cfif isDefined("session.valconresult.error10")>
                                                            <p align="left">
                                                                 <span class="sserrors">#session.valconresult.error10#</span></b>
                                                            </p>
                                                       </cfif>
                                                  </div>
                                             </div>
                                        </div>
                                        <div class="modal-footer d-flex justify-content-center align-items-center">
                                             <button type="button" class="btn btn-secondary btn-sm rounded-pill px-3" data-dismiss="modal">Close</button>
                                                  <input type="hidden" id="updatedata" name="updatedata" value=""/>
                                             <input type="hidden" name="userid" value="#user_id#"/>
                                             <input type="hidden" id="oldphoto" name="oldphoto" value=""/>
                                             <input type="submit" name="subcontact" id="subcontact" class="btn btn-primary btn-sm rounded-pill px-3" value="save">
                                        </div>
                                   </form>
                              </div>
                              <div class="col-md-3 bgsky " >
                                   <div class="mrsp ">
                                        <img src="images/noimage.png"  id="theimage" width="150" height="130" />
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
     </div>  
     <div class="modal fade" id="ViewModal" tabindex="-1" role="dialog" aria-labelledby="ViewModalLabel" aria-hidden="true">
          <div class="modal-dialog  modal-lg">
               <div class="modal-content ml-3 ht" >
                    <div class="col-md-12 col-xs-12" >
                         <div class="row" >
                              <div class="col-md-9 bgwhites formstyle1  pt-3 pl-5 pr-5 pb-3">
                                   <div class="cformhead">
                                        <h4>CONTACT DETAILS</h4>
                                   </div>
                                   <div class="row rowcenter">
                                        <div class="col-md-8 ht " >
                                             <table width="100%"  class="table-responsive table-responsive-stack" id="tview">
                                                  <tbody style="width: -webkit-fill-available !important;">
                                                       <tr>
                                                       <!-- <th class="txtcolrview">Contact ID </th><td>:</td><td><span id="coid"></span></td></tr><tr>-->
                                                            <th class="txtcolrview">Name</th><td >:</td><td><span id="cname"></span></td></tr><tr>
                                                            <th class="txtcolrview">Gender</th><td>:</td><td><span id="cgen"></span></td></tr><tr>
                                                            <th class="txtcolrview">BirthDay</th><td>:</td><td><span id="cbday"></span></td></tr><tr>
                                                            <th class="txtcolrview">Address</th><td>:</td><td><span id="cadd"></span></td></tr><tr>
                                                            <th class="txtcolrview">Pincode</th><td>:</td><td><span id="cpin"></span></td></tr><tr>
                                                            <th class="txtcolrview">Email ID</th><td>:</td><td><span id="cem"></span></td></tr><tr>
                                                            <th class="txtcolrview">Phone</th><td>:</td><td><span id="cph"></span></td>
                                                       </tr>
                                                  </tbody>
                                             </table>
                                        </div>                                          
                                   </div>
                                   <div class="d-flex justify-content-center align-items-center mb-5">
                                        <button type="button" class="btn btn-primary btn-sm rounded-pill px-3"  data-dismiss="modal">Close</button>
                                   </div>
                              </div>
                              <div class="col-md-3 bgsky" >
                                   <div class="mrsp">
                                        <img src="images/noimage.png" class="img-fluid"  id="theimageview" width="150" height="130" />
                                   </div>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
     </div> 
</cfoutput>
<script>
     var du = localStorage.getItem('dataupdated');
          if (du) 
     {
          $("#updatemsgdiv").addClass("alert alert-success alert1 text-center");
          $("#updatemsgdiv").show();
          $("#updatemsgdiv").html("Contact Updated Successfully"); 
          localStorage.removeItem('dataupdated');
     }
     var da = localStorage.getItem('dataadded');
          if (da) 
     {
          $("#addmsgdiv").addClass("alert alert-success alert1 text-center");
          $("#addmsgdiv").show();
          $("#addmsgdiv").html("Contact Saved Successfully"); 
          localStorage.removeItem('dataadded');
     }
     var modalId = localStorage.getItem('openModal');
     if (modalId != null) 
     {
          $("#exampleModal").modal("show");
          localStorage.removeItem('openModal');
     }
</script>