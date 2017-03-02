<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.indresh.javanet.Database" 
    import="org.indresh.javanet.Employee" import="java.util.LinkedList"
    import="org.indresh.javanet.MySqlConnector" import="org.indresh.javanet.Project"
    import="java.util.HashMap" import="java.util.ArrayList"%>
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
    
    function Alert(){
    	alert("New Project has been submitted");
    }
  </script> 
</head>

<body>
<%int i=0;
Database db=new Database();
MySqlConnector scon=new MySqlConnector();
ArrayList<String> li=new ArrayList<String>();
li=db.getAllEmployeeID(scon);
HashMap<String,String> hme=new HashMap<String,String>();
hme=db.getEmployeeList(scon);%>
  <div id="main">
	
	<div id="menubar">
	  <div id="welcome">
	    <h1><a href="#">Welcome To Drivedge</a></h1>
	  </div><!--close welcome-->
      <div id="menu_items">
	    <ul id="menu">
          <li class="current"><a href="AdminUserTimeLine.jsp">Home</a></li>
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
		  <div class="wel">
            <h1>Add New Project</h1></div>
	<div class="con">
		<form action="ProjectAdmin" method="get" onsubmit="Alert()">
		   <div class="pname">
				Project's Name:<input type="text" name="ProjectName" required/></div>
		   <div class="pid">Project's Id:<input type="text" name="PId" required/></div>
		   <div class="cname">
				Client's Name:<input type="text" name="ClientName" required/></div>
		   <div class="tech">
				Technology:<input type="text" name="Technology" required/></div>
           <div class="ptype">
				Project Type:<select name="ProjectType" required>
					<option value="Develoment">Development</option>
					<option value="TestingProduction">Testing Production</option>
					<option value="Support/Maintenance">Support/Maintenance</option>
				</select></div>
          <div class="pmanager" required>
				Project Manager:<select name="Manager">
					<option value="">--</option>
					<%for(String e:li){ %>
					<option value="<%=e%>"><%=hme.get(e) %></option><%} %>
				</select></div>
		 <div class="psd">
				Project Start Date:<input type="date" name="StartDate" format="yyyymmdd"/></div>
		 <div class="ped">
				Project End Date:<input type="date" name="EndDate" format="yyyymmdd"/></div>
		 <div class="des">
				Project Description:<textarea name="des" rows="2" cols="28"></textarea></div>
		 <div class="submit4">
				<input type="submit" name="Submit"/></div>
	</form></div>
          
		</div><!--close content_item-->
      </div><!--close content-->   

	  
 
  </div><!--close main-->
   <div id="footer">
	  Drivedge | Call Us: +91 (0)20 65231515.
  </div><!--close footer-->   
 	
  
</body>
</html>
