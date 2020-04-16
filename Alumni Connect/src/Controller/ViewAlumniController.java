package Controller;


import java.io.IOException;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.AlumniOperation;
import Model.User;

@WebServlet("/ViewAlumniController")
@MultipartConfig
public class ViewAlumniController extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		AlumniOperation op = new AlumniOperation();
		ArrayList<User> all =op.getAllUser();
		
		
		req.setAttribute("AlumniData", all);
		RequestDispatcher rd = req.getRequestDispatcher("admin_viewalumni.jsp");
		rd.forward(req, resp);
	}
}
