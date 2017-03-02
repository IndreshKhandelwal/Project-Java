package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditPhase
 */
@WebServlet("/EditPhase")
public class EditPhase extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		String phase=request.getParameter("Phase");
		String oldactivity=request.getParameter("oldactivity");
		String newactivity=request.getParameter("newactivity");
		try {
			db.EditPhase(phase, oldactivity, newactivity, scon);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("Phase.jsp");
	}

}
