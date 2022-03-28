<script src="js/jquery-3.6.0.js"></script>
<style type="text/css" media="print">
      @media print
      {
         @page {
           margin-top: 0;
           margin-bottom: 0;
         }
         body  {
           padding-top: 72px;
           padding-bottom: 72px ;
         }
      } 
</style>
<cfinvoke component="components.backend" method="displayalldataforreport" returnvariable="allcontacts"></cfinvoke>
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
</cfoutput>


              <script type="text/javascript">
    $(document).ready(function(){
        window.print();
    })
    window.onafterprint = function() {
        history.go(-1);
    };
</script>