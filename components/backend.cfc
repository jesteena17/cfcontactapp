<cfcomponent  displayname="EmployeesData">
     <cffunction name = "uploadfile" returnType = "any"  access = "public">
          <cfset variables.validMimeTypes =  {
                                         'image/jpeg': {extension: 'jpg'}
                                    ,'image/png': {extension: 'png'}
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
                         <cfabort showerror=cfcatch.message>
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
           <cfif   (variables.uname EQ "")>
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
          <cfset regdata=StructNew()/>
          <cfset StructInsert(regdata, "fname",variables.fname )/>
          <cfset StructInsert(regdata, "email",variables.email )/>
          <cfset StructInsert(regdata, "uname",variables.uname )/>
          <cfset StructInsert(regdata, "pword","")/>
          <cfset StructInsert(regdata, "cpword","")/>
          <cfset StructInsert(session, "valregudata", regdata ,true)/>
          <cfreturn variables.result>
     </cffunction>  
     <cffunction name="validateloginform"  access="public" returnType="struct"  output="false">
          <cfset variables.result=StructNew()/>
          <cfset variables.uname = trim(form.loginid)>
          <cfset variables.pword = trim(form.loginpassword)>
          <cfset variables.error1 = "">
          <cfset variables.error2 = "">
           <cfif  variables.uname EQ  "  ">
               <cfset variables.error1 = variables.error1 & "Enter  your email/password">
          </cfif>
          <cfif  variables.pword EQ "  ">
               <cfset variables.error2 = variables.error2 & "Enter your  password">
          </cfif>
          <cfset StructInsert(variables.result, "error1",variables.error1 )/>
          <cfset StructInsert(variables.result, "error2",variables.error2 )/>
          <cfset valloginudata=StructNew()/>
          <cfset StructInsert(valloginudata, "loginname",variables.uname )/>
           <cfset StructInsert(valloginudata, "password","" )/>
          <cfset StructInsert(session, "valloginudata", valloginudata ,true)/>
          <cfreturn variables.result>
     </cffunction>  
     <cffunction name="registration" output="false" access="REMOTE">
          <cfscript>
              var RegObj=CreateObject("component","backend");
              var valregresult=RegObj.validateregform();
               if (refind(':("[^"]+"|\d+|true|false)', serializeJSON(valregresult)) EQ 0)
               { 
                    var qInsert = new query();
                    qInsert.setName("qRegisterQry");
                    qInsert.addParam(name="fullname", value="#trim(form.fullname)#", cfsqltype="cf_sql_varchar");
                    qInsert.addParam(name="emailid", value="#trim(form.emailid)#", cfsqltype="cf_sql_varchar");
                    qInsert.addParam(name="username", value="#trim(form.username)#", cfsqltype="cf_sql_varchar");
                    qInsert.addParam(name="password", value="#hash(trim(form.origpassword))#", cfsqltype="cf_sql_varchar");
                    qInsert.addParam(name="userrole",  value="#trim(form.userrole)#", cfsqltype="cf_sql_varchar");
                    qInsert.setSql("insert into  register(fullname,emailid,username,password,userrole) 
                    values (:fullname, :emailid, :username, :password, :userrole)");
                    var qresult=qInsert.execute();
                    var genKey = qresult.getPrefix().generatedkey;
                    if(genkey>0)
                    {
                         StructDelete( session,"valregresult", "true");
                         StructDelete( session,"valregudata", "true");
                         StructInsert(session, "valreginsresult", "Registration Successfull,Please Sign In" ,true);
                         location("../signup.cfm", "no");
                    }
               }
               else
               {
                    StructInsert(session, "valregresult", valregresult ,true);
                    location("../signup.cfm", "no");
               }
          </cfscript>
     </cffunction>
     <cffunction name = "login"   access = "REMOTE">
          <cfscript>
           var RegObj=CreateObject("component","backend");
              var validloginresult=RegObj.validateloginform();
               if (refind(':("[^"]+"|\d+|true|false)', serializeJSON(validloginresult)) EQ 0)
               { 
                    var qSelect = new query();
                    qSelect.setName("qLoginQry");
                    qSelect.addParam(name="loginid", value="#trim(form.loginid)#", cfsqltype="cf_sql_varchar");
                    qSelect.addParam(name="loginpassword", value="#hash(trim(form.loginpassword))#", cfsqltype="cf_sql_varchar");
                    qSelect.setSql("Select * from register where  (emailid=:loginid or username=:loginid ) and password =:loginpassword");
                    var qresult=qSelect.execute().getResult(); 
                    var recordfound = qresult.recordcount;
                    if(recordfound>0){
                         session.stLoggedInUser = {'loggedin'=true,'username' = qresult.username, 'email' = qresult.emailid,
                                   'userID' = qresult.regid,'userRole'=qresult.userrole } ;
                         location(url = "../home.cfm", addtoken="no");
                    }
                    else
                    {
                         StructDelete( session,"valloginudata", "true");
                         StructInsert(session, "valloginmsg", "Incorrect Credentials" ,true);
                         location("../signin.cfm", "no");
                    }
               }
               else
               {
                    StructInsert(session, "validloginresult", validloginresult ,true);
                    location("../signin.cfm", "no");
               }
          </cfscript>
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
          <cfif  (NOT reFindNoCase("^[A-Z]*$",variables.firstname )) >
               <cfset variables.error2 = variables.error2 & "Enter a valid Firstname *">
          </cfif>
          <cfif  (NOT reFindNoCase("^[A-Z]*$",variables.lastname ))>
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
          <cfif (variables.phone EQ "" )>
               <cfset variables.error7 = variables.error7 & "Enter a valid Phone *">
          </cfif>
           <cfif   (variables.address EQ "")>
               <cfset variables.error8 = variables.error8 & "Enter A valid  Address *">
          </cfif>
           <cfif   (variables.street EQ "" )>
               <cfset variables.error9 = variables.error9 & "Enter A valid  Street *">
          </cfif>
           <cfif  (variables.pincode EQ "")>
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
          <cfset udata=StructNew()/>
          <cfset StructInsert(udata, "firstname",variables.firstname )/>
          <cfset StructInsert(udata, "lastname",variables.lastname )/>
          <cfset StructInsert(udata, "dob",variables.dob )/>
          <cfset StructInsert(udata, "email",variables.email )/>
          <cfset StructInsert(udata, "phone",variables.phone )/>
          <cfset StructInsert(udata, "address",variables.address )/>
          <cfset StructInsert(udata, "street",variables.street )/>
          <cfset StructInsert(udata, "pincode",variables.pincode )/>
          <cfset StructInsert(session, "valcondata", udata ,true)/>
          <cfreturn variables.result>
     </cffunction>  
    <cffunction name="displayalldata" access="public" returnType="any" output="false">  
          <cfargument name="usersid" required="true">    
          <cfset variables.getcontacts = EntityLoad('Contacts',{userid=arguments.usersid},'added_at desc')>
          <cfreturn variables.getcontacts>    
     </cffunction>
     <cffunction name="displayalldataforreport" access="public" returnType="query" output="false">      
          <cfscript>
               var qReport = new query();
               qReport.setName("qReportQry");
               qReport.addParam(name="uid", value="#session.stLoggedInUser.userID#", cfsqltype="cf_sql_integer");
               qReport.setSql("select c.*,r.fullname  from contacts c join register r on
                    (r.regid=c.userid) where c.userid =:uid");
               var qresult=qReport.execute().getResult(); 
          </cfscript>
          <cfreturn qresult>    
     </cffunction>
     <cffunction name="deletecontact" access="remote"  output="false">
          <cfargument name="cid" required="true">
          <cfscript>
              var qRemove = new query(); 
               qRemove.setName("qDeleteQry");
               qRemove.addParam(name="cid", value="#trim(form.cid)#", cfsqltype="cf_sql_integer");
               qRemove.setSql("delete from  contacts where cid = :cid ");
               var qresult=qRemove.execute();  
               var numRec=qresult.getPrefix();
               if(numRec.recordcount>0)
               { 
                    location(url = "../home.cfm", addtoken="no");
               }
          </cfscript>   
     </cffunction>
     <cffunction name="displaydata" access="remote" returnType="any" returnFormat="JSON" output="false">
          <cfargument name="editid" required="true">
          <cfscript>
               var qEditQry = new query();
               qEditQry.setName("qEditDtQry");
               qEditQry.addParam(name="cid", value="#arguments.editid#", cfsqltype="cf_sql_integer");
               qEditQry.setSql("select *  from contacts where cid = :cid");
               var getcontactbyid=qEditQry.execute().getResult(); 
          </cfscript>
          <cfreturn getcontactbyid>
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
               <cfscript>
                    qUpdatepic = new query(); 
                    qUpdatepic.setName("qPicUpdate");
                    qUpdatepic.addParam(name="profilepic", value="#arguments.photo#", cfsqltype="cf_sql_varchar");
                    qUpdatepic.addParam(name="regid", value="#arguments.uid#", cfsqltype="cf_sql_integer");
                    qUpdatepic.setSql("update register set  profilepic = :profilepic where regid = :regid");
                    qUpdatepic.execute();
                </cfscript>
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
          <cfscript>
               var qGetUserQry = new query();
               qGetUserQry.setName("qGetUserInQry");
               qGetUserQry.addParam(name="rid", value="#arguments.registerid#", cfsqltype="cf_sql_integer");
               qGetUserQry.setSql("select *  from register where regid= :rid");
               var getdetailsbyid=qGetUserQry.execute().getResult(); 
          </cfscript>
           <cfreturn getdetailsbyid> 
     </cffunction>
    <cffunction name="checkUsername" access="remote" returnType="string" returnformat="plain" output="true">
          <cfargument name="userinput" required="true">
          <cfargument name="userinputtype" required="true">
          <cfset variables.returnStg="">
          <cfscript>
               variables.qCheckExists = new query();
               qCheckExists.setName("qCheckUnEm");
               qCheckExists.addParam(name="userinput", value="#arguments.userinput#", cfsqltype="cf_sql_varchar");
               qCheckExists.addParam(name="userinputtype", value="#arguments.userinputtype#", cfsqltype="cf_sql_varchar");
          </cfscript>
          <cfif arguments.userinputtype EQ "un">
               <cfscript>
                    qCheckExists.setSql("SELECT username FROM register WHERE username=:userinput");
               </cfscript>
          <cfelseif arguments.userinputtype EQ "em">
               <cfscript>
                    qCheckExists.setSql("SELECT emailid FROM register  WHERE emailid=:userinput");
               </cfscript>
          </cfif>
          <cfscript>
               variables.qresultEx=qCheckExists.execute().getResult(); 
               variables.recordfound = qresultEx.recordcount;
               if(recordfound>=1)
               {
                    variables.returnStg="true";
               }
               else
               {
               variables.returnStg="false";
               }
          </cfscript>
          <cfreturn variables.returnStg>
    </cffunction>

</cfcomponent>



    