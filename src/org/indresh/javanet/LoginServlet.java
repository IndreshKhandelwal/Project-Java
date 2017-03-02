package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Database db;
	MySqlConnector scon=null;
	Employee e;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		scon=new MySqlConnector();
		String EId=request.getParameter("EId");
		String password=request.getParameter("password");
		e=new Employee();
		db=new Database();
		try {
			if(db.ValidateLogin(EId,password,scon)){
				Employee e=new Employee();
				e=db.setEmployeeDetails(EId, scon);
				boolean temp=db.checkManager(e,scon);
				request.getSession().setAttribute("Manager", temp);
				 request.getSession().setAttribute("Employee",e);
				 
				response.sendRedirect("TimeLine.jsp");
			}
			else{
				response.sendRedirect("InvalidLogin.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}


