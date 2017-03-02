package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RecordTimeSheet
 */
@WebServlet("/timesheet")
public class RecordTimeSheet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
		
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String PId=request.getParameter("Project");	
		String Phase=request.getParameter("Phase");
		String Activity=request.getParameter("Activity");
		String date=request.getParameter("date");
		String Time=request.getParameter("time");
		Database db=new Database();
		HttpSession session=request.getSession();
		
		MySqlConnector scon=new MySqlConnector();
		try {
			db.RecordTimeSheet((Employee)session.getAttribute("Employee"),PId, Phase, Activity,date,Time, scon);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("TimeLine.jsp");
		
		
		
	}

}
