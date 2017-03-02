package org.indresh.javanet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

/**
 * Servlet implementation class changep
 */
@WebServlet("/changep")
public class changep extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		String oldp=request.getParameter("old_pass");
		String newp=request.getParameter("new_pass");
		HttpSession session=request.getSession();
		Employee e=(Employee) session.getAttribute("Employee");
		try {
			if(db.checkoldpass(oldp,e.getEId(),scon)){
				try {
					db.changep(newp,e.getEId(),scon);
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				response.sendRedirect("ChangeP.jsp");
			}else response.sendRedirect("invalidp.jsp");
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
