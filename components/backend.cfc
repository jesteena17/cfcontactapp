<cfcomponent  displayname="EmployeesData">
     <cffunction name = "uploadfile" returnType = "any"  access = "public">
          <cfset variables.validMimeTypes =  {
                                         'image/jpeg': {extension: 'jpg'}
                                    ,'image/png': {extension: 'png'}
                                             } />
          <cfset variables.thisPath=expandPath('.') & '/contactimgs/'>
          <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
          <cftry>
               <cffile action="upload" filefield="FiletoUpload" destination="#variables.f_dir#" mode="777"
                    accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                    nameconflict="makeunique">
               <cfcatch type="any">
                    <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                         <cfabort showerror="Zero length file">
                    <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                         <cfabort showerror="Invalid file type">
                    <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                         <cfabort showerror="Empty form field">
                    <cfelse>
                         <cfabort showerror="Unhandled File Upload Error">
                    </cfif>
               </cfcatch>
          </cftry>
          <cfreturn uploadResult>
     </cffunction>   
     <cffunction name="validateregform"  access="public" returnType="struct"  output="false">
          <cfset variables.result=StructNew()/>
          <cfset variables.fname = trim(form.fullname)>
          <cfset variables.email = trim(form.emailid)>
          <cfset variables.uname = trim(form.username)>
          <cfset variables.pword = trim(form.origpassword)>
          <cfset variables.cpword = trim(form.confirm_password)>
          <cfset variables.error1 = "">
          <cfset variables.error2 = "">
          <cfset variables.error3 = "">
          <cfset variables.error4 = "">
          <cfset variables.error5 = "">
           <cfif  NOT reFindNoCase("^[A-Z]*$",variables.fname )>
               <cfset variables.error1 = variables.error1 & "Enter a valid name">
          </cfif>
          <cfif  NOT reFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$",variables.email )>
               <cfset variables.error2 = variables.error2 & "Enter a valid  emailid">
          </cfif>
           <cfif   (variables.uname EQ "" OR variables.uname EQ " " )>
               <cfset variables.error3 = variables.error3 & "Enter A valid  username">
          </cfif>
           <cfif  NOT reFindNoCase("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[##?!@$%^&*-]).{5,}$",variables.pword )>
               <cfset variables.error4 = variables.error4 & "minimum 5 characters,atleast one number,symbol,lowercase,uppercase letter">
          </cfif>
           <cfif  NOT reFindNoCase("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[##?!@$%^&*-]).{5,}$",variables.cpword )>
               <cfset variables.error5 = variables.error5 & "minimum 5 characters,atleast one number,symbol,lowercase uppercase letter">
          </cfif>
           <cfif  variables.pword NEQ variables.cpword >
               <cfset variables.error5 = variables.error5 & "Password and Confirm passwords must match">
          </cfif>
          <cfset StructInsert(variables.result, "error1",variables.error1 )/>
          <cfset StructInsert(variables.result, "error2",variables.error2 )/>
          <cfset StructInsert(variables.result, "error3",variables.error3 )/>
          <cfset StructInsert(variables.result, "error4",variables.error4 )/>
          <cfset StructInsert(variables.result, "error5",variables.error5 )/>
          <cfreturn variables.result>
     </cffunction>  
     <cffunction name="validateloginform"  access="public" returnType="struct"  output="false">
          <cfset variables.result=StructNew()/>
          <cfset variables.uname = trim(form.loginid)>
          <cfset variables.pword = trim(form.loginpassword)>
          <cfset variables.error1 = "">
          <cfset variables.error2 = "">
           <cfif  variables.uname EQ  "">
               <cfset variables.error1 = variables.error1 & "Enter  your email/password">
          </cfif>
          <cfif  variables.pword EQ "">
               <cfset variables.error2 = variables.error2 & "Enter your  password">
          </cfif>
          <cfset StructInsert(variables.result, "error1",variables.error1 )/>
          <cfset StructInsert(variables.result, "error2",variables.error2 )/>
          <cfreturn variables.result>
     </cffunction>  
     <cffunction name = "registration" returnType = "numeric"  access = "public">
          <cfargument name="fname" required="true" >
          <cfargument name="email" required="true" >
          <cfargument name="username" required="true" >
          <cfargument name="password" required="true" >
          <cfargument name="userrole" required="true" >
          <cfquery name = "local.addregistration"  result="myaddResult">
               insert into register(fullname,emailid,username,password,userrole) 
               values (    
                         <cfqueryparam value = "#arguments.fname#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.email#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.username#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#hash(arguments.password)#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.userrole#" cfsqltype = "cf_sql_varchar"/>
                     );  
          </cfquery>
          <cfset variables.getNumberOfRecords = listLen(myaddResult.generated_key)> 
          <cfreturn variables.getNumberOfRecords >
     </cffunction>
     <cffunction name = "login" returnType = "numeric"  access = "public">
          <cfargument name="loginid" required="true" >
          <cfargument name="loginpassword" required="true" >
          <cfset variables.isUserLoggedIn = "">
          <cfquery  name="local.validateUser"   result="tmpResult">
               SELECT * FROM register WHERE
               (username=<cfqueryparam value="#arguments.loginid#" cfsqltype="cf_sql_varchar" maxlength="255"> 
               or emailid=<cfqueryparam value="#arguments.loginid#" cfsqltype="cf_sql_varchar" maxlength="255">) 
               AND password=<cfqueryparam value="#hash(arguments.loginpassword)#" cfsqltype="cf_sql_varchar" maxlength="4000">
          </cfquery>
          <cfif tmpResult.RecordCount EQ 1>
               <cflock timeout=20 scope="Session" type="Exclusive">      
                    <cfset session.stLoggedInUser = {'loggedin'=true,'username' = validateUser.username, 'email' = validateUser.emailid,
                         'userID' = validateUser.regid,'userRole'=validateUser.userrole } />  
               </cflock>   
               <cfset variables.isUserLoggedIn = true>
          <cfelse>
               <cfset variables.isUserLoggedIn = false>
          </cfif>
          <cfreturn variables.isUserLoggedIn> 
     </cffunction>
     <cffunction name="validatecontactform"  access="public" returnType="struct"  output="false">
          <cfset variables.result=StructNew()/>
          <cfset variables.title = trim(form.title)>
          <cfset variables.firstname = trim(form.firstname)>
          <cfset variables.lastname = trim(form.lastname)>
          <cfset variables.gender = trim(form.gender)>
          <cfset variables.dob = trim(form.dob)>
           <cfset variables.email = trim(form.email)>
          <cfset variables.phone = trim(form.phone)>
          <cfset variables.address = trim(form.address)>
          <cfset variables.street = trim(form.street)>
          <cfset variables.pincode = trim(form.pincode)>
          <cfset variables.error1 = "">
          <cfset variables.error2 = "">
          <cfset variables.error3 = "">
          <cfset variables.error4 = "">
          <cfset variables.error5 = "">
          <cfset variables.error6 = "">
          <cfset variables.error7 = "">
          <cfset variables.error8 = "">
          <cfset variables.error9 = "">
          <cfset variables.error10 = "">
          <cfif  variables.title EQ "" >
               <cfset variables.error1 = variables.error1 & "Select a Title *">
          </cfif>
          <cfif  (NOT reFindNoCase("^[A-Z]*$",variables.firstname )) OR (variables.firstname EQ " ") >
               <cfset variables.error2 = variables.error2 & "Enter a valid Firstname *">
          </cfif>
          <cfif  (NOT reFindNoCase("^[A-Z]*$",variables.lastname )) OR (variables.lastname EQ " ")>
               <cfset variables.error3 = variables.error3 & "Enter a valid Lastname *">
          </cfif>
          <cfif  (variables.gender EQ "" )>
               <cfset variables.error4 = variables.error4 & "Select a Gender *">
          </cfif>
          <cfif  (variables.dob EQ "" OR variables.dob EQ "dd/mm/yyyy" )>
               <cfset variables.error5 = variables.error5 & "Select a Date *">
          </cfif>
          <cfif  NOT reFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$",variables.email )>
               <cfset variables.error6 = variables.error6 & "Enter a valid  Emailid *">
          </cfif>
          <cfif (variables.phone EQ "" OR  variables.phone EQ " " )>
               <cfset variables.error7 = variables.error7 & "Enter a valid Phone *">
          </cfif>
           <cfif   (variables.address EQ "" OR variables.address EQ " " )>
               <cfset variables.error8 = variables.error8 & "Enter A valid  Address *">
          </cfif>
           <cfif   (variables.street EQ "" OR variables.street EQ " " )>
               <cfset variables.error9 = variables.error9 & "Enter A valid  Street *">
          </cfif>
           <cfif  (variables.pincode EQ "" OR variables.pincode EQ " ")>
               <cfset variables.error10 = variables.error10 & "Enter a valid Pincode *">
          </cfif>
          <cfset StructInsert(variables.result, "error1",variables.error1 )/>
          <cfset StructInsert(variables.result, "error2",variables.error2 )/>
          <cfset StructInsert(variables.result, "error3",variables.error3 )/>
          <cfset StructInsert(variables.result, "error4",variables.error4 )/>
          <cfset StructInsert(variables.result, "error5",variables.error5 )/>
          <cfset StructInsert(variables.result, "error6",variables.error6 )/>
          <cfset StructInsert(variables.result, "error7",variables.error7 )/>
          <cfset StructInsert(variables.result, "error8",variables.error8 )/>
          <cfset StructInsert(variables.result, "error9",variables.error9 )/>
          <cfset StructInsert(variables.result, "error10",variables.error10 )/>
          <cfreturn variables.result>
     </cffunction>  
     <cffunction name = "storecontactinfo" returnType = "any"  access = "public">
          <cfargument name="title" required="true"/>
          <cfargument name="firstname" required="true"/>
          <cfargument name="lastname" required="true"/>
          <cfargument name="gender" required="true"/>
          <cfargument name="dob" required="true"/>
          <cfargument name="email"  required="true"/>
          <cfargument name="phone" required="true"/>
          <cfargument name="photo"  />
          <cfargument name="address"  required="true"/>
          <cfargument name="street" required="true"/>
          <cfargument name="pincode" required="true"/>
          <cfargument name="userid" required="true"/>
          <cfquery name = "addcontact"  result="myaddResult">
               insert into contacts(title,firstname,lastname,gender,birthday,email,mobile,address,street,photo,pincode,userid) 
               values (   
                         <cfqueryparam value = "#arguments.title#" cfsqltype = "cf_sql_varchar">,
                         <cfqueryparam value = "#arguments.firstname#" cfsqltype ="cf_sql_varchar">,
                         <cfqueryparam value = "#arguments.lastname#" cfsqltype = "cf_sql_varchar">,
                         <cfqueryparam value = "#arguments.gender#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.dob#" cfsqltype = "cf_sql_date"/>,
                         <cfqueryparam value ="#arguments.email#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.phone#" cfsqltype = "cf_sql_varchar">,
                         <cfqueryparam value ="#arguments.address#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.street#" cfsqltype = "cf_sql_varchar">,
                         <cfqueryparam value = "#arguments.photo#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.pincode#" cfsqltype = "cf_sql_varchar"/>,
                         <cfqueryparam value = "#arguments.userid#" cfsqltype = "cf_sql_integer"/>
                    );
          </cfquery>
          <cfset variables.getNumberOfRecords = listLen(myaddResult.generated_key)>
          <cfreturn variables.getNumberOfRecords>
     </cffunction> 
    <cffunction name="displayalldata" access="public" returnType="any" output="true">  
          <cfargument name="usersid" required="true">    
          <cfset variables.getcontacts = EntityLoad('Contacts',{userid=arguments.usersid},'added_at desc')>
          <cfreturn variables.getcontacts>    
     </cffunction>
     <cffunction name="displayalldataforreport" access="public" returnType="query" output="false">      
          <cfquery name = "local.getallcontacts" >
               select c.*,r.fullname  from contacts c join register r on
               (r.regid=c.userid) order by c.added_at desc;
          </cfquery>
          <cfreturn getallcontacts>    
     </cffunction>
     <cffunction name="deletecontact" access="public" returnType="string"  output="false">
          <cfargument name="cid" required="true">
          <cfquery name = "local.dltcontactimg"    result="deleteimgresults">
               select photo from  contacts where cid=<cfqueryparam value="#arguments.cid#" cfsqltype="cf_sql_integer">
          </cfquery>
           <cfset variables.thisPath=expandPath('.') & '/contactimgs/'>
          <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
           <cffile action="delete" file="#variables.f_dir#/#dltcontactimg.photo#">
          <cfquery name = "local.dltcontact"    result="deleteresults">
               delete from  contacts where cid=<cfqueryparam value="#arguments.cid#" cfsqltype="cf_sql_integer">
          </cfquery>
          <cfset variables.getNumberOfRecords = listLen(deleteresults.RecordCount)>
          <cfreturn variables.getNumberOfRecords>    
     </cffunction>
     <cffunction name="displaydata" access="remote" returnType="any" returnFormat="JSON" output="false">
          <cfargument name="editid" required="true">
          <cfquery name = "local.getcontactbyid"    >
               select *  from contacts where cid=<cfqueryparam value="#arguments.editid#"  cfsqltype="cf_sql_integer">      
          </cfquery>
          <cfreturn getcontactbyid> 
     </cffunction>
     <cffunction name="updatecontact" access="public" returnType="string"  output="false">
          <cfargument name="contid" required="true">
          <cfargument name="title" required="true"/>
          <cfargument name="firstname" required="true"/>
          <cfargument name="lastname" required="true"/>
          <cfargument name="gender" required="true"/>
          <cfargument name="dob" required="true"/>
          <cfargument name="email"  required="true"/>
          <cfargument name="phone" required="true"/>
          <cfargument name="photo"  required="true"/>
          <cfargument name="address"  required="true"/>
          <cfargument name="street" required="true"/>
          <cfargument name="pincode" required="true"/>
          <cfquery name = "upcontact"  result="myupdateResult">
               update contacts
               set  title= <cfqueryparam value = "#arguments.title#" cfsqltype = "cf_sql_varchar">,
               firstname=    <cfqueryparam value = "#arguments.firstname#" cfsqltype ="cf_sql_varchar">,
               lastname= <cfqueryparam value = "#arguments.lastname#" cfsqltype = "cf_sql_varchar">,
               gender=<cfqueryparam value = "#arguments.gender#" cfsqltype = "cf_sql_varchar"/>,
               birthday= <cfqueryparam value = "#arguments.dob#" cfsqltype = "cf_sql_date"/>,
               email=<cfqueryparam value ="#arguments.email#" cfsqltype = "cf_sql_varchar"/>,
               mobile=<cfqueryparam value = "#arguments.phone#" cfsqltype = "cf_sql_varchar">,
               address=<cfqueryparam value ="#arguments.address#" cfsqltype = "cf_sql_varchar"/>,
               street=<cfqueryparam value = "#arguments.street#" cfsqltype = "cf_sql_varchar">,
               photo=<cfqueryparam value = "#arguments.photo#" cfsqltype = "cf_sql_varchar"/>,
               pincode=<cfqueryparam value = "#arguments.pincode#" cfsqltype = "cf_sql_varchar"/>
               where cid= <cfqueryparam value = "#arguments.contid#" cfsqltype = "cf_sql_integer" >
          </cfquery>
          <cfset variables.getNumberOfRecords = listLen(myupdateResult.RecordCount)> 
          <cfreturn variables.getNumberOfRecords>    
     </cffunction> 
     <cffunction name = "updateprofilepic"  access="remote" returnType="any" returnFormat="JSON">
          <cfargument name="photo"  required="true"/>
          <cfargument name="uid" required="true"/>
          <cfset variables.validMimeTypes =  {
                                         'image/jpeg': {extension: 'jpg'}
                                    ,'image/png': {extension: 'png'}
                                             } />
                <cfset variables.thisPath=expandPath('..') & '/profilepics/' />
          <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath) />
  
          <cftry>
               <cffile action="upload" filefield="imageUpload" destination="#variables.f_dir#" mode="777"
                     result="uploadResult"
                    nameconflict="makeunique">
               <cfquery name = "local.uppcontact"  result="mypupdateResult">
                    update register
                    set   profilepic=<cfqueryparam value = "#arguments.photo#" cfsqltype = "cf_sql_varchar"/>
                    where regid= <cfqueryparam value = "#arguments.uid#" cfsqltype = "cf_sql_integer" >
               </cfquery>
               
               <cfcatch type="any">
                    <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                         <cfabort showerror="Zero length file">
                    <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                         <cfabort showerror="Invalid file type">
                    <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                         <cfabort showerror="Empty form field">
                    <cfelse>
                         <cfabort showerror="Unhandled File Upload Error">
                    </cfif>
                    
               </cfcatch>
          </cftry>
          <cfreturn uploadResult>
     </cffunction>   
      <cffunction name="displayreguserdata" access="remote" returnType="any" returnFormat="JSON" output="false">
          <cfargument name="registerid" required="true">
          <cfquery name = "local.getdetailsbyid"    >
               select *  from register where regid=<cfqueryparam value="#arguments.registerid#"  cfsqltype="cf_sql_integer">      
          </cfquery>
          <cfreturn getdetailsbyid> 
     </cffunction>
</cfcomponent>



    