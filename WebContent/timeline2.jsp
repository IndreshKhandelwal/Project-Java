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
<%		Employee e=(Employee)session.getAttribute("Employee"); 
		String[][] phaseactivity;
		Boolean temp=(Boolean)session.getAttribute("Manager");
		int i;
		ArrayList<String> pid=new ArrayList<String>();
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		HashMap<String,String> pr=new HashMap<String,String>();
		pr=db.getProjects(scon);
		pid=db.getAllProjectID(scon);
		HashMap<String,ArrayList<String>> actpha=new HashMap<String,ArrayList<String>>();
		actpha=db.getphaseactivity(scon);
		Set<String> phases=new HashSet<String>();
		phases=actpha.keySet();
		ArrayList<String> ph=new ArrayList<String>();
		Iterator it=phases.iterator();
		while(it.hasNext()){
			ph.add((String)it.next());
		}
		ArrayList<String> ac=new ArrayList<String>();
		ac=actpha.get(request.getParameter("count1"));
		Double time=db.calculatetimeinphase(request.getParameter("count2"), e.getEId(), request.getParameter("count1"), scon);
		
		%>	
		<div class="panelt">
		<p>Total Time Given To this Phase = <%=time %> hrs</p>
		</div>
		<div class="activ" id="acc">
		Activity:<select name="Activity" id="act" onchange="showstate2(this.value)" required>
		<option>--</option>
		<% for(int c=0;c<ac.size();c++){%>
		<option value="<%=ac.get(c)%>"><%=ac.get(c) %></option><%} %>
		</select></div>
		
		
		
</body>
</html>