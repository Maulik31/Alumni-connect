package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AlumniOperation;
import Model.User;

@WebServlet("/ViewAlumniByCourse")
public class ViewAlumniByCourse extends HttpServlet {
 @Override
 
	protected void doGet(HttpServletRequest req, javax.servlet.http.HttpServletResponse resp)
			throws ServletException, IOException {
	 String course= req.getParameter("course");
	 
		AlumniOperation ao = new AlumniOperation();
		ArrayList<User> all=ao.getAllUserbycourse(course);
		
		req.setAttribute("AlumniData", all);
		RequestDispatcher rd = req.getRequestDispatcher("admin_ViewAlumniByCourse.jsp");
		rd.forward(req, resp);
	}

}
