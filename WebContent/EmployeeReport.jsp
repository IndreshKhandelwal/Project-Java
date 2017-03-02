<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="org.indresh.javanet.Employee"
    import="org.indresh.javanet.Database" import="org.indresh.javanet.monthwisereport" import="org.indresh.javanet.MySqlConnector"
    import="java.util.HashMap" import="java.util.ArrayList" import="java.util.HashSet"
    import="java.util.Arrays" import="java.util.Iterator" import="java.util.Set"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Report</title>
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
            var url="EReport.jsp";
            url +="?count1=" +document.getElementById("employee").value + "&" + "count2=" +document.getElementById("month").value + "&" + "count3=" +document.getElementById("yr").value;
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
   .grey {
  background-color: rgba(128,128,128,.25);
}
.red {
  background-color: rgba(255,0,0,.25);
}
.blue {
  background-color: rgba(0,0,255,.25);
}
.yellow{background-color: yellow;}
.green{background-color: greenyellow;}</style>
</head>
<body>
<%Database db=new Database();
MySqlConnector scon=new MySqlConnector();
HashMap<String,String> emp=new HashMap<String,String>();
ArrayList<String> eid=new ArrayList<String>();
eid=db.getAllEmployeeID(scon);
emp=db.getEmployeeList(scon);
%>
        <div><form>Employee:<select id="employee" name="employee" required>
                <option value="">---</option>
                <%for(int i=0;i<emp.size();i++){%><option value="<%=eid.get(i)%>"><%=emp.get(eid.get(i)) %></option><%} %>
               </select>
           Month: <input type="number" id="month" name="month" min="1" max="12"  onchange="k()" required>
           Year: <input type="number" min="0" id="yr" name="yr" onchange="k()" required >
            <input type="button" id="" onclick="showstate()" value="Submit"> </div><br /><br />
            <hr>
            <div class="exp">
            <input type="button" onclick="tableToExcel('testTable', 'Book1')" value="Export to Excel"></div>
            <div id="dvData" class="tab"><table id="testTable"></table>
            </div><br /><br />
            
            <div class="back"><a href="AdminUserTimeLine.jsp">Back</a></div>
    </body>
</html>