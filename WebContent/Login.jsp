<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Initial Page</title>
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
	    <h1><a href="#">Welcome To Drivedge	</a></h1>
	  </div><!--close welcome-->
      <div id="menu_items">
	    
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
            <h2>Employee</h2>
			<form action="Login" method="post">
			<div class="Employee">
            Employee ID:<br /><input type="text" name="EId" width="15" height="6" required/></div>
			<div class="pass">
			Password:<br /><input type="password" name="password" width="11" required/></div>
			<div class="submit1">
			<input type="submit" name="Submit"/></div>
			</form>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->     		
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Admin</h2>
                   <form action="AdminVerify" method="post">
	
					<div class="pass">
					Password:<input type="password" name="password" width="11"/></div>
					<div class="submit2">
					<input type="submit" value="Submit"/></div>
					</form>	
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
		 		
      </div><!--close sidebar_container-->		  
	 
	  <div id="content">
        <div class="content_item">
		  <h1>Welcome To Project Management Portal</h1> 
	       	  
		  
		  	
		  	  
		  			  
		</div><!--close content_item-->
      </div><!--close content-->   
	
	  	
	</div><!--close site_content--> 
  
  </div><!--close main-->
  
  <div id="footer">
	  Drivedge | Call Us: +91 (0)20 65231515.
  </div><!--close footer-->  
  
</body>
</html>
