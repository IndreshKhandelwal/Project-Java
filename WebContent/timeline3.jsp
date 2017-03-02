<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="org.indresh.javanet.Employee"
    import="org.indresh.javanet.Database" import="org.indresh.javanet.MySqlConnector"
    import="java.util.HashMap" import="java.util.ArrayList" import="java.util.HashSet"
    import="java.util.Arrays" import="java.util.Iterator" import="java.util.Set"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="UTF-8">
<title>Employee TimeLine</title>


</head>
<body>
<%Employee e=(Employee)session.getAttribute("Employee"); 
		
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		
		Double time=db.calculatetimeinphaseandactivity(request.getParameter("count1"), e.getEId(), request.getParameter("count2"),request.getParameter("count3"), scon);
		
		%>	
		<div class="panelt" id="pa">
		<p>Total Time Given To this Phase = <%=time %> hrs</p>
		</div>

		
		
		
</body>
</html>