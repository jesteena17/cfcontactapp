<cfinvoke component="components.backend" method="displayalldataforreport" returnvariable="allcontacts"></cfinvoke>
<cfspreadsheet 
        action = "write" 
        filename="Contacts.xlsx" 
        query="allcontacts" 
        overwrite="true">
<cfheader name="Content-Type" value="unknown">
<cfheader name="Content-Disposition" value="attachment; filename=Contacts.xlsx">
<cfcontent type="Application/Unknown" file="/Applications/ColdFusion2021/cfusion/wwwroot/cfcontactapp/Contacts.xlsx" deletefile="No">