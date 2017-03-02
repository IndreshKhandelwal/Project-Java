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

	function Alert(x){
  		
  		if(x){
  		alert("Time Has Been Recorded");
  		}else alert("You have already assigned time to this phase of the project")
  		
  	}
  </script> 
</head>

<body>
<%
	Database db=new Database();
	MySqlConnector scon=new MySqlConnector();
	HashSet<String> phases=new HashSet<String>();
	phases=db.getphase(scon);
	HashMap<String,String> allpro=new HashMap<String,String>();
	allpro=db.getProjects(scon);
	ArrayList<String> allproid=new ArrayList<String>();
	allproid=db.getAllProjectID(scon);
	
	
%>
  <div id="main">
	
	<div id="menubar">
	  <div id="welcome">
	    <h1><a href="#">Welcome to Drivedge</a></h1>
	  </div><!--close welcome-->
      <div id="menu_items">
	    <ul id="menu">
          <li><a href="AdminUserTimeLine.jsp">Home</a></li>
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
         <div class="wel"><h1>Assign Time:</h1></div>
		 <div class="con">
		 <form action="AddTime" method="get">
		 <div class="pmanager">
			Project Name:<select name="PId" required>
			<%for(String e:allproid){ %>
				<option value="<%=e%>"><%=allpro.get(e) %></option><%} %>
			</select></div>
            <div class="pmanager">
				Phase:<select name="Phase" required>
			<%for(String p:phases){ %>
				<option value="<%=p%>"><%=p %></option><%} %>
			</select></div>
			<div class="des">
			Time:<input type="text" name="Time" required/></div>
			<div class="submit4">
			<input type="submit" value="Submit" required/></div>
	</form></div>

<script>


Alert(<%=session.getAttribute("Boolean")%>)

</script>

          </div><!--close form_settings-->
		</div><!--close content_item-->
      </div><!--close content-->   

	  
 
  </div><!--close main-->
  	  <div id="footer">
	  Drivedge | Call Us: +91 (0)20 65231515.
  </div><!--close footer-->   
  
</body>
</html>
