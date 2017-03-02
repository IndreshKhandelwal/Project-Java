<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="org.indresh.javanet.Employee"
    import="org.indresh.javanet.Database" import="org.indresh.javanet.MySqlConnector"
    import="java.util.HashMap" import="java.util.ArrayList" import="java.util.HashSet"
    import="java.util.Arrays" import="java.util.Iterator" import="java.util.Set"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
</head>
<body>
<%Database db =new Database();
MySqlConnector scon=new MySqlConnector();
HashSet<String> ph=db.getphase(scon);
HashMap<String,ArrayList<String>> li=db.getphaseactivity(scon);
ArrayList<String> act=new ArrayList<String>();
String phase=request.getParameter("count1");
act=li.get(phase);%>

<div class="pmanager" id="acc">
Select Activity Name*:<select name="oldactivity"  id="Activity" required>
<option value="">--</option>
<%for(String a:act){ %>
<option value="<%=a%>"><%=a %></option><%} %>
</select>
</div>

</body>
</html>