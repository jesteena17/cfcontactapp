 <cfoutput>
 <cfinvoke component="components.backend" method="displayalldataforreport" returnvariable="allcontacts"></cfinvoke>
 
 <cfset thisPath = ExpandPath("*.*")>
   <cfset f_dir = GetDirectoryFromPath(thisPath)>

   <cfset f_name = "file.csv">
   <cffile action="WRITE" file="#f_dir##f_name#"
   output="ID,Fullname,Gender,DOB,Username,Email ID,Phone,Address,photo,Date Created,Added by" addnewline="Yes">
 
   <cfloop query="allcontacts">
   <cffile action="APPEND" file="#f_dir##f_name#"
   output="#REPLACE(id, ",", "","AlL")#,#cid#,#title&'.'&firstname&' '&lastname# ,
   #gender#,#birthday#,#username#,#email#, #mobile#,#address&','&street&', '&pincode#,
    '/Applications/ColdFusion2021/cfusion/wwwroot/cfcontactapp/contactimgs/'&#photo#,#added_at#,
    #fullname#"
   addnewline="Yes">
   </cfloop>
</cfoutput>
   <cfheader name="Content-Type" value="unknown">
<cfheader name="Content-Disposition" value="attachment; filename=file.csv">
<cfcontent type="Application/Unknown" file="/Applications/ColdFusion2021/cfusion/wwwroot/cfcontactapp/file.csv" deletefile="No">