<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Monthly Report</title>
  <script>
 var tableToExcel = (function() {
      var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
      return function(table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
      }
    })()
</script>
<script type="text/javascript"> 
       function j() {if((document.getElementById("month").value<1)||(document.getElementById("month").value>12))
           window.alert("value of month should be between 1 and 12");
       else if(document.getElementById("yr").value<0)
               window.alert("value of year should be>=0");
            }
       
       var xmlhttp,xmlhttp1
     	function showstate(){
     		 
            if (typeof XMLHttpRequest != "undefined")
            {
              xmlHttp= new XMLHttpRequest();
            }
            var url="MReport.jsp";
            url +="?count1=" +document.getElementById("month").value + "&" + "count2=" +document.getElementById("yr").value;
            xmlHttp.onreadystatechange = stateChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send();
     	}
     	 function stateChange()
        {   
            if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
            {   
                document.getElementById("dvData").innerHTML=xmlHttp.responseText   
            }   
        }

</script>

    <style> 
    body{text-align:center;}
    .back a:visited{
    		text-decoration:none;
    		font-size:25px;
    		color:black;
    		
    		}
    		.back a{
    		text-decoration:none;
    		font-size:25px;
    		color:black;
    		}
   </style>
</head>
<body>
            <div class="m" id="r"> 
           Input Month:<input type="number" min="1" max="12" id="month"  placeholder="month" onchange="j()" required><br><br>
           Input Year: <input type="number" min="0"  id="yr"  placeholder="year" onchange="j()" required><br><br />
           </div>
           <input type="button" onclick="showstate()" value="Submit"/><br /><br />
           <hr />
           <div class="exp">
            <input type="button" onclick="tableToExcel('testTable', 'Book1')" value="Export to Excel"></div>
            <div id="dvData" class="tab"><table id="testTable"></table>
            </div>
            
            <div class="back"><a href="AdminUserTimeLine.jsp">Back</a></div>
        	
    </body>
</html>