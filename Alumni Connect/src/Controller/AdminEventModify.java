package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AllOperation;
import Model.Event;


@WebServlet("/eventmodify")
public class AdminEventModify extends HttpServlet {
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int id =Integer.parseInt(req.getParameter("id"));
		  String type =req.getParameter("type");
		  
		  if(type.equals("delete"))
		  {
			 AllOperation allop = new AllOperation();
			  
			  int i = allop.deleteEvent(id);
			  
			  if(i>0)
			  {
				  req.getRequestDispatcher("addevent").forward(req, resp);
			  }
		  }
		  
		  else if(type.equals("update"))
		  {
			  Event edata = new Event();
			AllOperation ope = new AllOperation();
			  edata = ope.getEventById(id);
			
			  req.setAttribute("data", edata);
			  req.getRequestDispatcher("admin_addevent.jsp").forward(req, resp);
		  }
	}

}
