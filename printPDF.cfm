<cfinvoke component="components.backend" method="displayalldata" returnvariable="allcontacts"></cfinvoke>
<cfdocument format="PDF" filename="file.pdf" overwrite="Yes"> 
   <cfoutput>
        <cfdocumentsection> 
            <cfdocumentitem type="header"> 
                <font size="-3"><i>Contact Report</i></font> 
            </cfdocumentitem> 
            <cfdocumentitem type="footer"> 
            <font size="-3">Page #cfdocument.currentpagenumber#</font> 
            </cfdocumentitem>         
            
            <table width="95%" border="2" cellspacing="2" cellpadding="2" > 
             <tr class="txtcolr">
                                                            <th >PHOTO</th>
                                                            <th >NAME</th>
                                                            <th >EMAIL ID</th>
                                                            <th >PHONE NUMBER</th>
                                                            
                                                       </tr>
                                                        <cfloop query="allcontacts"> 
                                                        <tr>
                                                                 <td><img src="./contactimgs/#allcontacts.photo#" width="100" height="100"/></td>
                                                                 <td>#allcontacts.title&'.'&allcontacts.firstname&' '&allcontacts.lastname #</td>
                                                                 <td>#allcontacts.email#</td>
                                                                 <td>#allcontacts.mobile#</td>
                                                                 </tr>
        
        </cfloop> 
           
        </cfdocumentsection> 
    </cfoutput> 
</cfdocument> 
<cfheader name="Content-Type" value="unknown">
<cfheader name="Content-Disposition" value="attachment; filename=file.pdf">
<cfcontent type="Application/Unknown" file="/Applications/ColdFusion2021/cfusion/wwwroot/cfcontactapp/file.pdf" deletefile="No">