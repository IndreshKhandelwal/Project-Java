package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewEmployeeAdmin
 */
@WebServlet("/AdminEmployee")
public class AddNewEmployeeAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String EName=request.getParameter("name");
		String EId=request.getParameter("EId");
		String Pass=request.getParameter("password");
		String designation=request.getParameter("designation");
		String department=request.getParameter("department");
		String grade=request.getParameter("grade");
		String jdate=request.getParameter("jdate");
		String rmanager=request.getParameter("rmanager");
		String mnumber=request.getParameter("mnumber");
		String oemail=request.getParameter("oemail");
		String pemail=request.getParameter("pemail");
		String bdate=request.getParameter("bdate");
		String caddress=request.getParameter("caddress");
		String paddress=request.getParameter("paddress");
		String education=request.getParameter("education");
		String exp=request.getParameter("exp");
		String pnumber=request.getParameter("pnumber");
		String anumber=request.getParameter("anumber");
		String passnumber=request.getParameter("passnumber");
		String bgroup=request.getParameter("bgroup");
		String mcard=request.getParameter("mcard");
		String bnumber=request.getParameter("bnumber");
		String mstatus=request.getParameter("mstatus");
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		try {
			db.AddEmployee(EId, EName,Pass,designation,department,grade,jdate,rmanager,mnumber,oemail,pemail,bdate,caddress,paddress,education,exp,pnumber,pnumber,passnumber,bgroup,mcard,bnumber,mstatus, scon);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("Addnewemployee.jsp");
		
	}

}
