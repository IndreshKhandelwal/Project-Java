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

     <style> 
   #caption{
   				font-size:18px;
   				
   				margin:20px;
   				
   			}
    th{
    background-color:rgba(0,0,255,.25);}
    body{text-align:center;}
   td{background-color:#f2f78d;
   }
   table{
   border-collapse:collapse;
   margin-bottom:20px;}
   </style>
</head>
<body>
<%	String EId=request.getParameter("count1");
	
	HashMap<String,String>emp=new HashMap<String,String>();
	String month=request.getParameter("count2");
	String year=request.getParameter("count3");
	Database db=new Database();
	MySqlConnector scon=new MySqlConnector();
	emp=db.getEmployeeList(scon);
	String ename=emp.get(EId);
	monthwisereport mi=new monthwisereport();
	ArrayList<monthwisereport> li=new ArrayList<monthwisereport>();
	li=db.getmonthwisereport(month, year, scon);
	
	%>
      <div id="dvData">  <table id="testTable" cellspacing="6" cellpadding="5"  width="90%"  align="center" border="1">
      <caption id="caption"><%String monthString;
           	int Month=Integer.parseInt(month);
       		switch (Month) {
            case 1:  monthString = "January";       break;
            case 2:  monthString = "February";      break;
            case 3:  monthString = "March";         break;
            case 4:  monthString = "April";         break;
            case 5:  monthString = "May";           break;
            case 6:  monthString = "June";          break;
            case 7:  monthString = "July";          break;
            case 8:  monthString = "August";        break;
            case 9:  monthString = "September";     break;
            case 10: monthString = "October";       break;
            case 11: monthString = "November";      break;
            case 12: monthString = "December";      break;
            default: monthString = "Invalid month"; break;}%>Employee name:<%=ename %>--<%=monthString %>\<%=year %></caption>
        
    <tr>  
	
	<th>Project</th>
	<th>Phase</th>
	<th>Activity</th>
	<th>Date</th>
	<th>Time Spent(Hours)</th>
    <tbody>
    			<%for(monthwisereport m:li){ %><tr >
    			<%if(m.getEId().equals(EId)){ %>
    				<td><%=m.getPId() %></td>
    				<td><%=m.getPhase() %></td>
    				<td><%=m.getActivity() %></td>
    				<td><%=m.getDate() %></td>
           			<td><%=m.getTime() %></td>
                </tr><%} %><%} %>
                
                </tbody>
          </table></div>
          
          
       

    </body>
</html>