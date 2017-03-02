package org.indresh.javanet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;

import java.util.LinkedList;
import java.util.Map;

import com.mysql.jdbc.Statement;

import java.lang.Integer;



public class Database 
{	
	
	static private Connection conn = null;
	
	PreparedStatement ps = null;
	ResultSet rs=null;	
	java.sql.Statement s=null;
	

		
	public boolean ValidateLogin(String EId,String Password,MySqlConnector scon) throws Exception, IOException, SQLException
	{	
		scon.OpenConnection();
		conn=scon.getConnection();
		conn.setAutoCommit(false);
		String pass; 
		
		String Validate_login = "Select * from employee where EId=?";
		
		ps = conn.prepareStatement(Validate_login);
		ps.setString(1,EId);
		
		rs=ps.executeQuery();
		
		if(rs.next()==false || rs.getString("Password")==null || rs.getString("EmployeeName")==null)
		{
			return false;
		}
		
		
		pass=rs.getString("Password");
		
		conn.close();
		scon.close();
		ps.close();
		
		if(Password.equals(pass))
		 {
			
			 return true;
		 }
		 else
		 {
			 return false;
		 }

		 
	}
	public Employee setEmployeeDetails(String EId,MySqlConnector scon) throws  ClassNotFoundException, SQLException{
		Employee e=new Employee();
		scon.OpenConnection();
		conn=scon.getConnection();
		conn.setAutoCommit(false);	
		String EmployeeName = "Select EmployeeName from employee where EId=?";
		ps = conn.prepareStatement(EmployeeName);
		
		ps.setString(1,EId);
		
		rs=ps.executeQuery();
		
		if(rs.next()){
		String name = rs.getString("EmployeeName");
		e.setEmployeeName(name);
		}
		
		
		e.setEId(EId);
		
		conn.close();
		ps.close();
		return e;
	}

public boolean checkManager(Employee e,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	boolean temp=true;
	HashMap<String,String> li=new HashMap<String,String>();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from projectmanager";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	int i=0;
	while(rs.next()){
	li.put(rs.getString("EId"),rs.getString("PId"));
	i++;
	}
	
	conn.close();
	scon.close();
	s.close();
	if(li.get(e.getEId())==null)return false;
	else return true;
}
public LinkedList<String> getprojectManager(Employee e,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	LinkedList<String> li=new LinkedList<String>();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select PId from projectmanager Where EId=?";
	ps = conn.prepareStatement(Query);
	String eid =e.getEId();
	ps.setString(1,eid);
	rs=ps.executeQuery();
	while(rs.next()){
		li.add(rs.getString("PId"));
	}
	
	conn.close();
	scon.close();
	ps.close();
	return li;
}
public HashMap<String,String> getEmployeeList(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	HashMap<String,String> li=new HashMap<String,String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from employee";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.put(rs.getString("EId"), rs.getString("EmployeeName"));
	}
	
	conn.close();
	scon.close();
	s.close();
	return li;
}
public HashMap<String,String>getProjects(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	HashMap<String,String> li=new HashMap<String,String>();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from project";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.put(rs.getString("PId"), rs.getString("ProjectName"));
	}
	
	conn.close();
	scon.close();
	s.close();
	return li;
}
public ArrayList<String> getAllEmployeeName(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	ArrayList<String> li=new ArrayList<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from employee";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("EmployeeName"));
	}
	conn.close();
	scon.close();
	s.close();
	return li;
}
public ArrayList<String> getAllEmployeeID(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	ArrayList<String> li=new ArrayList<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from employee";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("EId"));
	}
	
	conn.close();
	scon.close();
	s.close();
	return li;
}
public void setEmployeeProject(String EId,String PId,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO employeeproject VALUES(?,?)";
	ps=conn.prepareStatement(Query);
	ps.setString(1,EId);
	ps.setString(2, PId);
	ps.executeUpdate();
	conn.commit();
	conn.close();
	scon.close();
	ps.close();
}
public ArrayList<String> getAllProjectID(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	ArrayList<String> li=new ArrayList<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from project";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("PId"));
	}
	scon.close();
	conn.close();
	s.close();
	return li;
}
public void RecordTimeSheet(Employee e,String PId,String Phase,String Activity,String date,String Time,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO timesheet VALUES(?,?,?,?,?,?)";
	ps=conn.prepareStatement(Query);
	double time = Double.parseDouble(Time);
	String eid=e.getEId();
	ps.setString(1,eid);
	ps.setString(2, PId);
	ps.setString(3,Phase);
	ps.setString(4, Activity);
	ps.setString(5, date);
	ps.setDouble(6,time);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
	ps.close();
}
public void AddEmployee(String EId,String EmployeeName,String pass,String designation,String department,String grade,String jdate,String rmanager,String mnumber,String oemail,String pemail,String bdate,String caddress,String paddress,String education,String exp,String pnumber,String anumber,String passnumber,String bgroup,String mcard,String bnumber,String mstatus,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO employee VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	ps=conn.prepareStatement(Query);
	ps.setString(1,EId);
	ps.setString(2,EmployeeName);
	ps.setString(3, pass);
	ps.setString(4, designation);
	ps.setString(5, department);
	ps.setString(6,grade);
	ps.setString(7, jdate);
	ps.setString(8, rmanager);
	ps.setString(9, mnumber);
	ps.setString(10, oemail);
	ps.setString(11, pemail);
	ps.setString(12, bdate);
	ps.setString(13, caddress);
	ps.setString(14, paddress);
	ps.setString(15, education);
	ps.setString(16, exp);
	ps.setString(17, pnumber);
	ps.setString(18,anumber);
	ps.setString(19, passnumber);
	ps.setString(20, bgroup);
	ps.setString(21, mcard);
	ps.setString(22, bnumber);
	ps.setString(23, mstatus);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
	ps.close();
}
public void AddProject(String PId,String ProjectName,String ClientName,String Technology,String ProjectType,String StartDate,String EndDate,String des,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO project VALUES(?,?,?,?,?,?,?,?)";
	ps=conn.prepareStatement(Query);	
	ps.setString(1,PId);
	ps.setString(2,ProjectName);
	ps.setString(3,ClientName);
	ps.setString(4,Technology);
	ps.setString(5,ProjectType);
	ps.setString(6,StartDate);
	ps.setString(7,EndDate);
	ps.setString(8,des);
	
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
	ps.close();
}
public void AddProjectManager(String PId,String EId,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO projectmanager VALUES(?,?)";
	ps=conn.prepareStatement(Query);
	ps.setString(1,PId);
	ps.setString(2,EId);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
	ps.close();
}


public ArrayList<String> getactivities(MySqlConnector scon) throws  SQLException, ClassNotFoundException{
	ArrayList<String> li=new ArrayList<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT Activity FROM phaseactivity";
	s=conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("Activity"));
	}
	return li;
}

@SuppressWarnings("null")
public HashMap<String,ArrayList<String>> getphaseactivity(MySqlConnector scon) throws  SQLException, ClassNotFoundException{
	HashMap<String,ArrayList<String>> li=new HashMap<String,ArrayList<String>>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT * FROM phaseactivity";
	s=conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		addValues(rs.getString("Phase"), rs.getString("Activity"),li);
	}
	return li;
}
private HashMap<String,ArrayList<String>> addValues(String key, String value,HashMap<String,ArrayList<String>> hashMap) {

	ArrayList<String> tempList =new ArrayList<String>();
	   if (hashMap.containsKey(key)) {
	      tempList = hashMap.get(key);
	      tempList.add(value);  
	   } else {
	      tempList.add(value);               
	   }
	   hashMap.put(key,tempList);
	   
	   return hashMap;
	}

public ArrayList<String> getEmployeeassignedtoproject(String PId,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	ArrayList<String> li=new ArrayList<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT EId FROM employeeproject WHERE PId = ?";
	ps=conn.prepareStatement(Query);
	ps.setString(1,PId);
	rs=ps.executeQuery();
	while(rs.next()){
		li.add(rs.getString("EId"));
	}

	conn.close();
	scon.close();
	ps.close();
	return li;
}

public HashSet<String> timeassignedprojects(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	HashSet<String> li=new HashSet<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT PId FROM phaseactualtime";
	s=conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("PId"));
	}
	return li;
}

public HashSet<String> getphase(MySqlConnector scon) throws  SQLException, ClassNotFoundException{
	HashSet<String> li=new HashSet<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT Phase FROM phaseactivity";
	s=conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("Phase"));
	}
	return li;
}
public void AddTime(String PId,String Phase,String Time,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO phaseactualtime VALUES(?,?,?)";
	ps=conn.prepareStatement(Query);
	Double time=Double.parseDouble(Time);
	ps.setString(1,PId);
	ps.setString(2,Phase);
	ps.setDouble(3,time);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
	ps.close();
}

public boolean Validatetimeassign(String PId,String Phase,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	boolean x=true;
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT * FROM phaseactualtime";
	s=conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		if(PId.equals(rs.getString("PId")) && Phase.equals(rs.getString("Phase"))){
			x=false;
		}
	}
	return x;
	
}
public Double calculatetimeinphase(String PId,String EId,String Phase,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	Double x=null;
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT SUM(Time) as Total_Time FROM timesheet WHERE EId=? AND PId=? AND Phase=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, EId);
	ps.setString(2, PId);
	ps.setString(3, Phase);
	rs=ps.executeQuery();
	while(rs.next()){
		x=rs.getDouble("Total_Time");
	}
	
	return x;
}
public Double calculatetimeinphaseandactivity(String PId,String EId,String Phase,String Activity,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	Double x=null;
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT SUM(Time) as Total_Time FROM timesheet WHERE EId=? AND PId=? AND Phase=? AND Activity=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, EId);
	ps.setString(2, PId);
	ps.setString(3, Phase);
	ps.setString(4, Activity);
	rs=ps.executeQuery();
	while(rs.next()){
		x=rs.getDouble("Total_Time");
	}

	return x;
}

public Double calculatetimeinphaseandactivityanddate(String PId,String EId,String Phase,String Activity,String Date,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	Double x=null;
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT SUM(Time) as Total_Time FROM timesheet WHERE EId=? AND PId=? AND Phase=? AND Activity=? AND Date<=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, EId);
	ps.setString(2, PId);
	ps.setString(3, Phase);
	ps.setString(4, Activity);
	ps.setString(5, Date);
	rs=ps.executeQuery();
	while(rs.next()){
		x=rs.getDouble("Total_Time");
	}
	
	return x;
}

public ArrayList<monthwisereport>getmonthwisereport(String Month,String Year,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	monthwisereport mi;
	ArrayList<monthwisereport> li=new ArrayList<monthwisereport>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT * FROM timesheet WHERE MONTH(Date) = ? AND YEAR(Date) =? ORDER BY Date ASC";
	ps=conn.prepareStatement(Query);
	ps.setString(1, Month);
	ps.setString(2, Year);
	rs=ps.executeQuery();
	while(rs.next()){
		mi=new monthwisereport();
		mi.setEId(rs.getString("EId"));
		mi.setPId(rs.getString("PId"));
		mi.setPhase(rs.getString("Phase"));
		mi.setActivity(rs.getString("Activity"));
		mi.setDate(rs.getString("Date"));
		mi.setTime(rs.getString("Time"));
		li.add(mi);
	}

	return li;
}
public void deleteemployee(String eid,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="DELETE FROM employee WHERE EId=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, eid);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
}
public void deleteproject(String pid,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="DELETE FROM project WHERE PId=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, pid);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
}
public HashMap<String,String> getProjectManager(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	HashMap<String,String> pm=new HashMap<String,String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="SELECT * FROM projectmanager";
	s=conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		pm.put(rs.getString("PId"), rs.getString("EId"));
	}
	conn.close();
	scon.close();
	return pm;
}
public ArrayList<String> getprojectmanagerID(MySqlConnector scon) throws ClassNotFoundException, SQLException{
	ArrayList<String> li=new ArrayList<String>();
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);	
	String Query = "Select * from projectmanager";
	s = conn.createStatement();
	rs=s.executeQuery(Query);
	while(rs.next()){
		li.add(rs.getString("PId"));
	}
	
	conn.close();
	scon.close();
	s.close();
	return li;
}
public void changepm(String p, String e, MySqlConnector scon) throws SQLException, ClassNotFoundException {
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="UPDATE projectmanager SET EId=? WHERE PId=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, e);
	ps.setString(2, p);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
	
}
public boolean checkoldpass(String p,String eid,MySqlConnector scon) throws SQLException, ClassNotFoundException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String pass;
	String Query = "Select * from employee where EId=?";
	ps = conn.prepareStatement(Query);
	ps.setString(1,eid);
	
	rs=ps.executeQuery();
	
	if(rs.next()==false || rs.getString("Password")==null || rs.getString("EmployeeName")==null)
	{
		return false;
	}
	
	
	pass=rs.getString("Password");
	
	conn.close();
	scon.close();
	ps.close();
	
	if(p.equals(pass))
	 {
		
		 return true;
	 }
	 else
	 {
		 return false;
	 }
	
}
public void changep(String p,String eid,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="Update employee SET Password=? WHERE EId=?";
	ps=conn.prepareStatement(Query);
	ps.setString(1, p);
	ps.setString(2, eid);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
}
public void AddPhase(String pname,String aname,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="INSERT INTO phaseactivity VALUES(?,?)";
	ps=conn.prepareStatement(Query);
	ps.setString(1, pname);
	ps.setString(2, aname);
	ps.executeUpdate();
	
	conn.commit();
	conn.close();
	scon.close();
}
public void DeletePhase(String pname,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="DELETE FROM phaseactivity WHERE Phase IN (?)";
	ps=conn.prepareStatement(Query);
	ps.setString(1, pname);
	ps.executeUpdate();
	conn.commit();
	conn.close();
	scon.close();
}

public void EditPhase(String pname,String oldactivity,String newactivity,MySqlConnector scon) throws ClassNotFoundException, SQLException{
	scon.OpenConnection();
	conn=scon.getConnection();
	conn.setAutoCommit(false);
	String Query="UPDATE phaseactivity SET Activity=? WHERE Phase=? AND Activity=?;";
	ps=conn.prepareStatement(Query);
	
	ps.setString(1, newactivity);
	ps.setString(2, pname);
	ps.setString(3, oldactivity);
	ps.executeUpdate();
	conn.commit();
	conn.close();
	scon.close();
}
}
