<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.indresh.javanet.Database" 
    import="org.indresh.javanet.Employee" import="java.util.LinkedList"
    import="org.indresh.javanet.MySqlConnector" import="org.indresh.javanet.Project"
    import="java.util.HashMap" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Employee To Project</title>

<script type="text/javascript">
var xmlhttp
  	function showstate(str){
  		 
         if (typeof XMLHttpRequest != "undefined")
         {
           xmlHttp= new XMLHttpRequest();
         }
         var url="addemployeetoproject2.jsp";
         url +="?count1=" +str;
         xmlHttp.onreadystatechange = stateChange;
         xmlHttp.open("GET", url, true);
         xmlHttp.send();
  	}
  	 function stateChange()
     {   
         if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
         {   
             document.getElementById("ee").innerHTML=xmlHttp.responseText   
         }   
     }
  	 function Alert(){
  		 alert("Your Time Sheet Has Been Recorded");
  	 }
  </script>
</head>
<body>
<%int i;Database db=new Database();
	MySqlConnector scon=new MySqlConnector();
	Employee e=new Employee();
	ArrayList<String> EName=new ArrayList<String>();
	ArrayList<String> EId=new ArrayList<String>();
	EId=db.getAllEmployeeID(scon);
	HashMap<String,String> eml=new HashMap<String,String>();
	eml=db.getEmployeeList(scon);
	ArrayList<String> speem=new ArrayList<String>();
	speem=db.getEmployeeassignedtoproject(request.getParameter("count2"), scon);
	String eid=request.getParameter("EId");
	
	for(String w:speem){
			EId.remove(w);
		}
	e=(Employee)session.getAttribute("Employee");
	EId.remove(e.getEId());
		
	String proj=(String)request.getParameter("count2");
	%>
		<div class="emp1" id="ee">
		Select Employee:<select name="Employee" required>
		<option value="">---</option>
		<%for(String x:EId){%>
			<option value="<%=x%>"><%=eml.get(x) %></option><%} %>
		</select></div>


</body>
</html>