package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTime
 */
@WebServlet("/AddTime")
public class AddTime extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String PId=request.getParameter("PId");
		String Phase=request.getParameter("Phase");
		String Time=request.getParameter("Time");
		
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		try {
			request.getSession().setAttribute("Boolean",db.Validatetimeassign(PId, Phase, scon) );
	
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(db.Validatetimeassign(PId, Phase, scon)){
				
				db.AddTime(PId, Phase, Time, scon);
				
			}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		response.sendRedirect("AssignTime.jsp");
		
	}
}
