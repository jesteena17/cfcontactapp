<cfif (structKeyExists(form, "subcontact"))> 
    <cfif form.updatedata NEQ "">
          <cfset variables.filefield="#form.oldphoto#"/>
          <cfif form.FiletoUpload NEQ "">
               <cfinvoke component="components.backend" method="uploadfile" returnvariable="fileresult"></cfinvoke>
               <cfif fileresult.serverFile EQ "">
                    <cfset variables.filefield="#form.oldphoto#"/>
               <cfelse>
                    <cfset variables.filefield=fileresult.serverFile/>
               </cfif>
          </cfif> 
          <cfdump var="#variables.filefield#">
          <cfinvoke component="components.backend" method="updatecontact" returnvariable="result">
               <cfinvokeargument name="title" value="#form.title#" />
               <cfinvokeargument name="firstname" value="#form.firstname#" />
               <cfinvokeargument name="lastname" value="#form.lastname#" />
               <cfinvokeargument name="gender" value="#form.gender#" />
               <cfinvokeargument name="dob" value="#form.dob#" />
               <cfinvokeargument name="email" value="#form.email#" />
               <cfinvokeargument name="phone" value="#form.phone#" />
               <cfinvokeargument name="photo" value="#variables.filefield#" />
               <cfinvokeargument name="address" value="#form.address#" />
               <cfinvokeargument name="street" value="#form.street#" />
               <cfinvokeargument name="pincode" value="#form.pincode#" /> 
               <cfinvokeargument name="contid" value="#form.updatedata#"/>  
          </cfinvoke>
          <cfif result GT 0>
               <cflocation url="home.cfm" addtoken="no">
          </cfif>
    <cfelse>
          <cfset variables.filefield="avt1.png"/>
          <cfif form.FiletoUpload NEQ "">
               <cfinvoke component="components.backend" method="uploadfile" returnvariable="fileresult"></cfinvoke>
               <cfif fileresult.serverFile EQ "">
                    <cfset variables.filefield="avt1.png"/>
               <cfelse>
                    <cfset variables.filefield=fileresult.serverFile/>
               </cfif>
          </cfif> 
          <cfinvoke component="components.backend" method="storecontactinfo" returnvariable="result">
               <cfinvokeargument name="title" value="#form.title#" />
               <cfinvokeargument name="firstname" value="#form.firstname#" />
               <cfinvokeargument name="lastname" value="#form.lastname#" />
               <cfinvokeargument name="gender" value="#form.gender#" />
               <cfinvokeargument name="dob" value="#form.dob#" />
               <cfinvokeargument name="email" value="#form.email#" />
               <cfinvokeargument name="phone" value="#form.phone#" />
               <cfinvokeargument name="photo" value="#variables.filefield#" />
               <cfinvokeargument name="address" value="#form.address#" />
               <cfinvokeargument name="street" value="#form.street#" />
               <cfinvokeargument name="pincode" value="#form.pincode#" />
               <cfinvokeargument name="userid" value="#form.user_id#" />
          </cfinvoke>
          <cfif result GT 0>
               <cflocation url="home.cfm" addtoken="no">
          </cfif>
    </cfif>
</cfif>



                        