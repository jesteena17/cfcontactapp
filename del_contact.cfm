<cfset  variables.key="eid"/>
<cfinvoke component="components.backend" method="deletecontact" returnvariable="result">
     <cfinvokeargument name="cid" value=#Decrypt(URL.die, key)#/>  
</cfinvoke>
<cfif result GT 0>  
    <cflocation url="home.cfm" addtoken="no">
</cfif>
