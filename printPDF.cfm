<cfset pdfObj=CreateObject("component","components.backend")/>
<cfset allcontacts=pdfObj.displayalldataforreport()/>
<cfdocument format="PDF" filename="Contacts.pdf" overwrite="Yes" orientation = "landscape"  > 
     <cfoutput>
          <cfdocumentsection> 
               <cfdocumentitem type="header"> 
                         <font size="-3"><i>Contact Report</i></font> 
               </cfdocumentitem> 
               <cfdocumentitem type="footer"> 
                         <font size="-3">Page #cfdocument.currentpagenumber#</font> 
               </cfdocumentitem>         
               
               <table width="100%" border="1"  > 
               <tr class="txtcolr">
                    <th >PHOTO</th>
                    <th >NAME</th>
                    <th >GENDER</th>
                    <th >DOB</th>
                    <th >EMAIL ID</th>
                    <th >PHONE NUMBER</th>
                    <th >ADDRESS</th>
                    <th >CREATED AT</th>
                    <th >CREATED BY</th>
               </tr>
               <cfloop query="allcontacts"> 
                    <tr>
                         <td><img src="./contactimgs/#allcontacts.photo#" width="100" height="100"/></td>
                         <td>#allcontacts.title&'.'&allcontacts.firstname&' '&allcontacts.lastname#</td>
                         <td>#allcontacts.gender#</td>
                         <td>#allcontacts.birthday#</td>
                         <td>#allcontacts.email#</td>
                         <td>#allcontacts.mobile#</td>
                         <td>#allcontacts.address&',<br>'&allcontacts.street&',<br>'&allcontacts.pincode#</td>
                         <td>#allcontacts.added_at#</td>
                         <td>#allcontacts.fullname#</td>
                    </tr>
               </cfloop>
        </cfdocumentsection> 
    </cfoutput> 
</cfdocument> 
<cfheader name="Content-Type" value="application/pdf">
<cfheader name="Content-Disposition" value="attachment; filename=Contacts.pdf">
<cfcontent type="Application/pdf" file="/Applications/ColdFusion2021/cfusion/wwwroot/cfcontactapp/Contacts.pdf" deletefile="No">