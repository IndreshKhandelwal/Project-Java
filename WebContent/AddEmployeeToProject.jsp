<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="org.indresh.javanet.Database" 
    import="org.indresh.javanet.Employee" import="java.util.LinkedList"
    import="org.indresh.javanet.MySqlConnector" import="org.indresh.javanet.Project"
    import="java.util.HashMap" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
  <title>Add Employee To Project</title>
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
var xmlhttp
function showstate(str){
if (typeof XMLHttpRequest != "undefined")
{
xmlHttp= new XMLHttpRequest();
}
var url="addemployeetoproject2.jsp";
url +="?count2=" +str;
xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("GET", url, true);
xmlHttp.send();
}
function stateChange()
{
if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
{
document.getElementById("ee").innerHTML=xmlHttp.responseText
}
}
function Alert(){
alert("Employee Has Been Added");
}
</script>
</head>

<body>
<%int i;Database db=new Database();
	MySqlConnector scon=new MySqlConnector();
	Employee e=new Employee();
	ArrayList<String> EName=new ArrayList<String>();
	ArrayList<String> EId=new ArrayList<String>();
		e=(Employee)session.getAttribute("Employee");
		Project p=new Project();
		HashMap<String,String> hmp=new HashMap<String,String>();
		hmp=db.getProjects(scon);
		EName=db.getAllEmployeeName(scon);
		EId=db.getAllEmployeeID(scon);
		LinkedList<String> li=new LinkedList<String>();
		scon.OpenConnection();
		li=db.getprojectManager(e,scon);%>
  <div id="main">
	
	<div id="menubar">
	  <div id="welcome">
	    <h1><a href="#">Welcome to Drivedge</a> </h1>
		
	  </div><!--close welcome-->
      <div id="menu_items">
	    <ul id="menu">
			<li><a href="TimeLine.jsp">Home</a></li>
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
		 <form action="EmployeeProject" method="get" onsubmit="Alert()">
			<div class="ptype">
			Select Project:<select name="Project" onchange="showstate(this.value)" required>
			<option value="">---</option>
			<%for(i=0;i<li.size();i++){%>
			<option value="<%=li.get(i)%>"><%=hmp.get(li.get(i)) %></option>
			<%}%>
		</select></div>
		<div class="ptype" id="ee">
			Select Employee:<select name="Employee" required>
		</select></div>
		<div class="submit4">
			<input type="submit" name="Submit"/></div>
		</form>
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