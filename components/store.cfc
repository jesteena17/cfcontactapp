  <script src="js/jquery-3.6.0.js"></script>
<cfcomponent>
     <cffunction name = "storecontactinfo" returnType = "any"  access = "remote">
        <cfinvoke component="backend" method="validatecontactform" returnvariable="valconresult"></cfinvoke>
              
               <cfif refind(':("[^"]+"|\d+|true|false)', serializeJSON(valconresult)) EQ 0>  
                    <cfif not form.updatedata EQ "">
                         <cfset variables.filefield=form.oldphoto/>
                         <cfif not form.FiletoUpload EQ "">
                              <cfinvoke component="components.backend" method="uploadfile" returnvariable="fileresult"></cfinvoke>
                              <cfif fileresult.serverFile EQ "">
                                   <cfset variables.filefield=form.oldphoto/>
                              <cfelse>
                                   <cfset variables.filefield=fileresult.serverFile/>
                              </cfif>
                         </cfif>
                         <cfquery name = "upcontact"  result="myupdateResult">
                              update contacts
                              set  title= <cfqueryparam value = "#form.title#" cfsqltype = "cf_sql_varchar">,
                              firstname=    <cfqueryparam value = "#form.firstname#" cfsqltype ="cf_sql_varchar">,
                              lastname= <cfqueryparam value = "#form.lastname#" cfsqltype = "cf_sql_varchar">,
                              gender=<cfqueryparam value = "#form.gender#" cfsqltype = "cf_sql_varchar"/>,
                              birthday= <cfqueryparam value = "#form.dob#" cfsqltype = "cf_sql_date"/>,
                              email=<cfqueryparam value ="#form.email#" cfsqltype = "cf_sql_varchar"/>,
                              mobile=<cfqueryparam value = "#form.phone#" cfsqltype = "cf_sql_varchar">,
                              address=<cfqueryparam value ="#form.address#" cfsqltype = "cf_sql_varchar"/>,
                              street=<cfqueryparam value = "#form.street#" cfsqltype = "cf_sql_varchar">,
                              photo=<cfqueryparam value = "#variables.filefield#" cfsqltype = "cf_sql_varchar"/>,
                              pincode=<cfqueryparam value = "#form.pincode#" cfsqltype = "cf_sql_varchar"/>
                              where cid= <cfqueryparam value = "#form.updatedata#" cfsqltype = "cf_sql_integer" >
                         </cfquery>
                         <cfset variables.getNumberOfRecords = listLen(myupdateResult.RecordCount)> 
                         <cfif variables.getNumberOfRecords GT 0>
                              <cfoutput >
                                   Updated
                              </cfoutput>
                         </cfif>
                    <cfelse>
                         <cfset variables.filefield="noimage.png"/>
                         <cfif not form.FiletoUpload EQ "">
                              <cfinvoke component="backend" method="uploadfile" returnvariable="fileresult"></cfinvoke>
                              <cfif fileresult.serverFile EQ "">
                                   <cfset variables.filefield="noimage.png"/>
                              <cfelse>
                                   <cfset variables.filefield=fileresult.serverFile/>
                              </cfif>
                         </cfif> 
                         <cfquery name = "addcontact"  result="myaddResult">
                              insert into contacts(title,firstname,lastname,gender,birthday,email,mobile,address,street,photo,pincode,userid) 
                              values (   
                                        <cfqueryparam value = "#form.title#" cfsqltype = "cf_sql_varchar">,
                                        <cfqueryparam value = "#form.firstname#" cfsqltype ="cf_sql_varchar">,
                                        <cfqueryparam value = "#form.lastname#" cfsqltype = "cf_sql_varchar">,
                                        <cfqueryparam value = "#form.gender#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#form.dob#" cfsqltype = "cf_sql_date"/>,
                                        <cfqueryparam value ="#form.email#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#form.phone#" cfsqltype = "cf_sql_varchar">,
                                        <cfqueryparam value ="#form.address#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#form.street#" cfsqltype = "cf_sql_varchar">,
                                        <cfqueryparam value = "#variables.filefield#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#form.pincode#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#form.userid#" cfsqltype = "cf_sql_integer"/>
                                   );
                         </cfquery>
                         <cfset variables.getNumberOfRecords = listLen(myaddResult.generated_key)>
                         <cfif variables.getNumberOfRecords GT 0>
                              <cfoutput >
                                   Added
                              </cfoutput>
                         </cfif>
                    </cfif>
               <cfelse>
                    <cfset StructInsert(session, "valconresult", valconresult ,true)/>
           <cflocation url="home.cfm" addtoken="no"/>
            
             
               </cfif>
     </cffunction> 
     </cfcomponent>