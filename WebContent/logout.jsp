<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Log Out</title>
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
	    <h1><a href="#">Welcome to Drivedge</a> </h1>
		
	  </div><!--close welcome-->
      <div id="menu_items">
	    <ul id="menu">
<li><a href="Login.jsp">Homepage</a></li>
         
       
        
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
		  <%session.invalidate();%>
<p>Log Out Successfull</p></h1><div>

         
</div>


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