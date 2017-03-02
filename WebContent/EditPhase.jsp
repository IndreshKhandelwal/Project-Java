<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="org.indresh.javanet.Employee"
    import="org.indresh.javanet.Database" import="org.indresh.javanet.MySqlConnector"
    import="java.util.HashMap" import="java.util.ArrayList" import="java.util.HashSet"
    import="java.util.Arrays" import="java.util.Iterator" import="java.util.Set"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<title>Edit Phase</title>
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
alert("Phase Edited");
}

var xmlhttp,xmlhttp1
function showstate(str){
	if (typeof XMLHttpRequest != "undefined")
	{
		xmlHttp= new XMLHttpRequest();
	}
	
	var url="EditPhase2.jsp";
	url +="?count1=" +str;
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
</script>
</head>
<body>
<%Database db =new Database();
MySqlConnector scon=new MySqlConnector();
HashSet<String> ph=db.getphase(scon);%>
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
<h1>Edit Phase:</h1>
</div>
<br /><br/>
<div class="con">
<form action="EditPhase" method="get" onsubmit="Alert()">
<div class="pmanager">
Select Phase Name*:<select name="Phase" onchange="showstate(this.value)" required>
<option value="">--</option>
<%for(String e:ph){ %>
<option value="<%=e%>"><%=e %></option><%} %>
</select>
</div>
<div class="pmanager" id="acc">
Select Activity Name*:<select name="oldactivity"  id="Activity" required>
</select>
</div>
<div class="ptype">
Enter New Activity Name*:<input type="text" name="newactivity" required/></div>
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