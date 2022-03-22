<cfcomponent  displayname="EmployeesData">
     <cffunction name = "uploadfile" returnType = "any"  access = "public">
          <cfset variables.validMimeTypes =  {
                                        'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                                        ,'application/msword': {extension: 'doc', application: 'Word (97-2003)'}
                                        ,'application/vnd.openxmlformats-officedocument.wordprocessingml.document': {extension: 'docx', application: 'Word (2007)'}
                                             } />
          <cfset variables.thisPath=expandPath('..') & '/contactimgs/'>
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
           <cfif  NOT reFindNoCase("^[a-z0-9]+$",variables.uname )>
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
               or emailid=<cfqueryparam value="#arguments.loginid#" cfsqltype="cf_sql_varchar" maxlength="255"> ) 
               AND password=<cfqueryparam value="#hash(arguments.loginpassword)#" cfsqltype="cf_sql_varchar" maxlength="4000">
          </cfquery>
          <cfif tmpResult.RecordCount EQ 1>      
               <cfset session.stLoggedInUser = {'loggedin'=true,'username' = validateUser.username, 'email' = validateUser.emailid,
                    'userID' = validateUser.regid,'userRole'=validateUser.userrole } />     
               <cfset variables.isUserLoggedIn = true>
          <cfelse>
               <cfset variables.isUserLoggedIn = false>
          </cfif>
          <cfreturn variables.isUserLoggedIn> 
     </cffunction>
</cfcomponent>



    