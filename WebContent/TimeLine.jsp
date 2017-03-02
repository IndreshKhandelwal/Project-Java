<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="org.indresh.javanet.Employee"
    import="org.indresh.javanet.Database" import="org.indresh.javanet.MySqlConnector"
    import="java.util.HashMap" import="java.util.ArrayList" import="java.util.HashSet"
    import="java.util.Arrays" import="java.util.Iterator" import="java.util.Set"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Drivedge</title>
  <meta name="description" content="free website template" />
  <meta name="keywords" content="enter your keywords here" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <link rel="stylesheet" type="text/css" href="css/style1.css" />
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.easing.min.js"></script>
  <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
  <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
  </script> 
  
<script type="text/javascript">
	var xmlhttp,xmlhttp1
	function showstate(str){
		if (typeof XMLHttpRequest != "undefined")
		{
			xmlHttp= new XMLHttpRequest();
		}
		
		var url="timeline2.jsp";
		url +="?count1=" +str + "&" + "count2=" +document.getElementById("projj").value;
		xmlHttp.onreadystatechange = stateChange;
		xmlHttp.open("GET", url, true);
		xmlHttp.send();
	}
	
	function stateChange()
	{
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{
	document.getElementById("acc").innerHTML=xmlHttp.responseText
	}
	}
	
	function showstate2(str){
	if (typeof XMLHttpRequest != "undefined")
	{
	xmlHttp1= new XMLHttpRequest();
	}
	var url="timeline3.jsp";
	url +="?count1=" +document.getElementById("projj").value + "&" + "count2=" +document.getElementById("phase1").value+"&"+"count3="+str;
	xmlHttp1.onreadystatechange = stateChange2;
	xmlHttp1.open("GET", url, true);
	xmlHttp1.send();
	}
	
	function stateChange2()
	{
	if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete")
	{
	document.getElementById("patt").innerHTML=xmlHttp1.responseText
	}
	}
	
	function showstate3(str){
	if (typeof XMLHttpRequest != "undefined")
	{
	xmlHttp1= new XMLHttpRequest();
	}
	var url="timeline4.jsp";
	url +="?count1=" +document.getElementById("projj").value + "&" + "count2=" +document.getElementById("phase1").value+"&"+"count3=" +document.getElementById("act").value+"&"+"count4="+str;
	xmlHttp1.onreadystatechange = stateChange3;
	xmlHttp1.open("GET", url, true);
	xmlHttp1.send();
	}
	
	function stateChange3()
	{
	if (xmlHttp1.readyState==4 || xmlHttp1.readyState=="complete")
	{
	document.getElementById("dd").innerHTML=xmlHttp1.responseText
	}
	}
	
	function Alert(){
	alert("Time Sheet Recorded");
	}
</script>
</head>

<body>
<%Employee e=(Employee)session.getAttribute("Employee"); 
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
	
		%>
  <div id="main">
	
	<div id="menubar">
	  <div id="welcome">
	    <h1><a href="#">Welcome to Drivedge</a> </h1>
		
	  </div><!--close welcome-->
      <div id="menu_items">
	    <ul id="menu"><li><a href="TimeLine.jsp">Home</a></li>
         <%if(temp){%> <li><a href="AddEmployeeToProject.jsp">Add Employees</a></li><%} %>
			<li><a href="ChangeP.jsp">Change Password</a></li>
			<li><a href="logout.jsp">LogOut</a></li>
        </ul>
      </div><!--close menu-->
    </div><!--close menubar-->	
	
	<div id="site_content">	

	  <div id="banner_image">
	    <div id="slider-wrapper">        
          <div id="slider" class="nivoSlider">
            <img src="images/home_1.jpg" alt="" />
            <img src="images/home_2.jpg" alt="" />
		  </div><!--close slider-->
		</div><!--close slider_wrapper-->
	  </div><!--close banner_image-->	

	  
      <div id="content">
        <div class="content_item">
		  <div class="form_settings">
		  <h1><div class="wel">
			<p>Hello <%=e.getEmployeeName() %></p></div></h1>
         <div class="con">
		 <form action="timesheet" method="get" onsubmit="Alert()">
		<div Class="ptype" id="l">
			Select Project:<select name="Project" id="projj" required>
		<option value="">--</option>
			<%for(i=0;i<pr.size();i++){%>
			<option value="<%=pid.get(i)%>"><%=pr.get(pid.get(i)) %></option><%} %>
		</select></div>
			<div class="ptype">
			Select Phase:<select name="Phase" id="phase1" onchange="showstate(this.value)" required>
		<option value="">--</option>
		<%for(String p:ph){%>
			<option value="<%=p%>"><%=p %></option><%} %>
		</select></div>
			<div class="ptype" id="acc">
			Activity:<select name="Activity" id="act" onchange="showstate2(this.value)" required></select></div>
			<div class="panelt" id="patt">
				<p></p>
			</div>
			<div class="des">
			Date:<input type="date" name="date" id="d" format=yyyymmdd onchange="showstate3(this.value)" required/></div>
			<div class="panelt" id="dd">
			<p></p>
			</div>
			<div class ="des">Time:<input type="text" name="time" required/></div>
			<div class="submit4">
			<input type="submit"/></div>
			</form></div>


        </div > <!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content-->   
</div>
	  
	</div><!--close site_content--> 
 
  </div><!--close main-->
  	
   <div id="footer">
   Drivedge|Call Us:+91 (0)20 65231515
  </div><!--close footer-->  	
  
</body>
</html>
