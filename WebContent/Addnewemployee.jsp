<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="org.indresh.javanet.Employee"
    import="org.indresh.javanet.Database" import="org.indresh.javanet.MySqlConnector"
    import="java.util.HashMap" import="java.util.ArrayList" import="java.util.HashSet"
    import="java.util.Arrays" import="java.util.Iterator" import="java.util.Set"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Add Employee</title>
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
    	alert("Employee Added");
    }
  </script> 
</head>

<body>
<%HashMap<String,String>emp=new HashMap<String,String>();
Database db=new Database();
MySqlConnector scon=new MySqlConnector();
emp=db.getEmployeeList(scon);
ArrayList<String> eid=new ArrayList<String>();
eid=db.getAllEmployeeID(scon);%>
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

	    
	 
	 
        <div class="wel">
		  <h1>Add New Employee:</h1> 
	      </div>
			<br /><br/>
			<div class="con">
		   <form action="AdminEmployee" method="get" onsubmit="Alert()">
		   
			
			<div class="ename">
				Employee Name*:<input type="text" name="name" required/></div>	
			<div class="eiid">
				Employee's ID*:<input type="text" name="EId" required/></div>
			<div class="passso">
				Employee's Password*:<input type="password" name="password" required/></div>
			<div class="desgination">
				Designation:<input type="text" name="designation"/></div>
			<div class="department">
				Department:<input type="text" name="department"/></div>
			<div class="grade">
				Grade:<input type="text" name="grade"/></div>
			<div class="jdate">
				Joining Date:<input type="date" name="jdate" format="yyyymmdd"/></div>
			<div class="rmanager">
				Reporting Manager:<select name="rmanager">
				<option value="">---</option>
				<%for(int i=0;i<emp.size();i++){ %>
				<option value="<%=eid.get(i)%>"><%=emp.get(eid.get(i)) %></option><%} %>
				</select></div>
			<div class="mnumber">
				Mobile Number:<input type="text" name="mnumber"/></div>
			<div class="oemail">
				Email Id(Official):<input type="text" name="oemail"/></div>
			<div class="pemail">
				Email Id(Personal):<input type="text" name="pemail"></div>
			<div class="bdate">
				BirthDate:<input type="date" name="bdate"/></div>
			<div class="caddress">
				Current Address:<input type="textarea" name="caddress" rows="" col=""/></div>
			<div class="paddress">
				Permanent Address:<input type="textarea" name="paddress" rows="" col=""/></div>
			<div class="education">
				Education:<input type="text" name="education"></div>
			<div class="exp">
				Years Of Experience:<input type="text" name="exp"></div>
			<div class="pnumber">
				Pan Card Number:<input type="text" name="pnumber"></div>
			<div class="pnumber">
				Adhaar Card Number:<input type="text" name="anumber"></div>
			<div class="pnumber">
				Passport Number:<input type="text" name="passnumber"></div>	
			<div class="bgroup">
				Blood Group:<input type="text" name="bgroup"></div>
			<div class="mcard">
				Medical Card Number:<input type="text" name="mcard"/></div>
			<div class="bnumber">
				Bank Account Number:<input type="text" name="bnumber"/></div>
			<div class="mstatus">
				Marrital Status:<input type="text" name="mstatus"/></div>
			<br />
			<br />
			<div class="submit3">
				<input type="submit" name="Submit"/></div>
				
	</form></div>
		  	
		 
          			  
		
      
	
	  	
	</div><!--close site_content--> 
  
  </div><!--close main-->
  
  <div id="footer">
	  Drivedge | Call Us: +91 (0)20 65231515.
  </div><!--close footer-->   
  
</body>
</html>
