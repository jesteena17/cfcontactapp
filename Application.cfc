<cfcomponent>
<cfset this.name = "myApplication">
<cfset this.clientStorage="Cookie"/>
<cfset this.Sessionmanagement = TRUE>
<cfset this.sessionTimeout = #CreateTimeSpan(0, 0, 20, 0)#/>
<cfset this.clientManagement = true>
<cfset this.setClientCookies = true /> 
<cfset this.datasource="mysqldsn" />
<cfset this.ormenabled = "true"> 
<cfset this.ormsettings = {datasource="mysqldsn", logsql="true"}> 
<cfset This.scriptProtect="all"/>

<cffunction name="onApplicationStart" returntype="boolean" >
    
      
	<cfreturn true />
</cffunction>



<cffunction 
    name="OnRequestStart" 
    access="public" 
    returntype="boolean" 
    output="false" 
    hint="blklist contains pageslist that cant be accessed without login.">
  
 <cfset local.currentpage = listLast(CGI.SCRIPT_NAME,"/")/>
 <cfset local.blackList = ['main.cfm,home.cfm','printPrint.cfm','printExcel.cfm','printPDF.cfm']/>
<cfif arrayFindNoCase(local.blackList,local.currentpage ) and  session.stLoggedInUser.loggedin eq false>
   <cflocation  url="logout.cfm" addtoken=false>
</cfif>
  
    <cfreturn true />

</cffunction>


<cffunction name="onSessionStart" access="public" output="false" returntype="void">
        <cflock timeout=20 scope="Session" type="Exclusive">      
                    <cfset session.stLoggedInUser = {'loggedin'=false,'username' = '', 'email' = '',
                         'userID' = 0,'userRole'='' } />  
               </cflock> 
</cffunction>

<cffunction name="onMissingTemplate" returntype="Boolean" output="false">
    <cfargument name="templateName" required="true" type="String" />

    <cflocation url="logout.cfm" addtoken=false/>

    <cfreturn true />
</cffunction>

</cfcomponent>