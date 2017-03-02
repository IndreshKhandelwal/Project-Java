package org.indresh.javanet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminVerify
 */
@WebServlet("/AdminVerify")
public class AdminVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Pass=request.getParameter("password");
		if(Pass.equals("Admin")){
			response.sendRedirect("AdminUserTimeLine.jsp");
		}
		else{
			response.sendRedirect("InvalidLoginAdmin.jsp");
		}
	}

}
