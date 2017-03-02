package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddEmployeeToProjectServlet
 */
@WebServlet("/EmployeeProject")
public class AddEmployeeToProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Database db=null;
		MySqlConnector scon=null;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String PId=request.getParameter("Project");
		HashMap<String,String> em=new HashMap<String,String>();
		HashMap<String,String> pr=new HashMap<String,String>();
		String EId=request.getParameter("Employee");
		db=new Database();
		
		scon=new MySqlConnector();
		try {
			
			em=db.getEmployeeList(scon);
			pr=db.getProjects(scon);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		/*HttpSession session=request.getSession();
		session.setAttribute("PId",PId);
		session.setAttribute("EId", EId);*/
		try {
			db.setEmployeeProject(EId,PId, scon);
			response.sendRedirect("AddEmployeeToProject.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	

}
