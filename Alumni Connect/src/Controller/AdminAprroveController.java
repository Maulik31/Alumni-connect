package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AlumniOperation;

@WebServlet("/status")
public class AdminAprroveController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id =Integer.parseInt(req.getParameter("id"));
	    AlumniOperation al=new AlumniOperation();
	    int i =al.updateStatus(id);
	    
	
		
		if(i>0)
		{
			RequestDispatcher rd =req.getRequestDispatcher("ViewAlumniController");
			rd.forward(req, resp);
		}
		
	}
}
