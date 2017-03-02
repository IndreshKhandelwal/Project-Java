package org.indresh.javanet;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddNewProjectAdmin
 */
@WebServlet("/ProjectAdmin")
public class AddNewProjectAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String PId=request.getParameter("PId");
		String ProjectName=request.getParameter("ProjectName");
		String ClientName=request.getParameter("ClientName");
		String Technology=request.getParameter("Technology");
		String ProjectType=request.getParameter("ProjectType");
		String ProjectManager=request.getParameter("Manager");
		String StartDate=request.getParameter("StartDate");
		String EndDate=request.getParameter("EndDate");
		String des=request.getParameter("des");
		Database db=new Database();
		MySqlConnector scon=new MySqlConnector();
		try {
			db.AddProject(PId, ProjectName, ClientName, Technology, ProjectType, StartDate, EndDate, des, scon);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			db.AddProjectManager(PId, ProjectManager, scon);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("newproject", ProjectName);
		response.sendRedirect("AdminUserTimeLine.jsp");
	}

}
