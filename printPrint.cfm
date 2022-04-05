<link href="css/printstyle.css" rel="stylesheet"/>

<cfset printObj=CreateObject("component","components.backend")/>
<cfset allcontacts=printObj.displayalldataforreport()/> 
<cfoutput>
     <table width="100%" border="1"  id="employee"> 
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
     </table>
</cfoutput>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/printjs.js" type="text/javascript"></script>