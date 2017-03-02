<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Admin User TimeLine</title>
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
</head>

<body>
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

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Reports</h2>
			<ul>
				<li><div class="month"><a href="MonthlyReport.jsp">MonthWise Report</a></div></li>
				<li><div class="Em"><a href="EmployeeReport.jsp">EmployeeWise Report</a></div></li>
			</ul>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->     		
		  		
      </div><!--close sidebar_container-->		  
	 
	  <div id="content">
        <div class="content_item">
		  <h1>Welcome Admin</h1> 
	      
		  <div class="content_container">
		    <ul>
				<li><a href="Addnewemployee.jsp">Add New Employee</a></li><br />
				<li><a href="Addnewproject.jsp">Add New Project</a></li><br />
				<li><a href="AssignTime.jsp">Assign Time To Projects</a></li><br />
				<li><a href="Phase.jsp">Phase and Activity</a></li><br />
				<li><a href="DeleteEmployee.jsp">Delete Employee</a></li><br />
				<li><a href="DeleteProject.jsp">Delete Project</a></li><br />
				<li><a href="ChangePM.jsp">Remove/Change the Project Manager</a></li>
			</ul>
		  	
		  </div><!--close content_container-->
          			  
		</div><!--close content_item-->
      </div><!--close content-->   
	
	  	
	</div><!--close site_content--> 
  
  </div><!--close main-->
  
   <div id="footer">
	  Drivedge | Call Us: +91 (0)20 65231515.
  </div><!--close footer-->   
  
</body>
</html>
