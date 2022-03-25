 <cfoutput>
 <cfinvoke component="components.backend" method="displayalldata" returnvariable="allcontacts"></cfinvoke>
 
 <cfset thisPath = ExpandPath("*.*")>
   <cfset f_dir = GetDirectoryFromPath(thisPath)>

   <cfset f_name = "file.csv">
   <cffile action="WRITE" file="#f_dir##f_name#"
   output="Fullname, Email ID,  Phone" addnewline="Yes">
 
   <cfloop query="allcontacts">
   <cffile action="APPEND" file="#f_dir##f_name#"
   output="#REPLACE(Fullname, ",", "","AlL")#,#title&'.'&firstname&' '&lastname # , #email#, #mobile#"
   addnewline="Yes">
   </cfloop>
</cfoutput>
   <cfheader name="Content-Type" value="unknown">
<cfheader name="Content-Disposition" value="attachment; filename=file.csv">
<cfcontent type="Application/Unknown" file="/Applications/ColdFusion2021/cfusion/wwwroot/cfcontactapp/file.csv" deletefile="No">