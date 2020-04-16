package Controller;


import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.AllOperation;
import Model.Event;


@WebServlet("/addevent")
public class AdminEventUpload extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AllOperation allop=new AllOperation();
		  List<Event> even = allop.getAllEvent(); 
			req.setAttribute("service", even);
			req.getRequestDispatcher("admin_addevent.jsp").forward(req, resp);
		}
		
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  
		String ac=req.getParameter("action");
		if(ac.equals("submit"))
		{
			String ename=req.getParameter("ename");
			String edetails=req.getParameter("edetails");
			
			Event e1 = new Event();
			e1.setEvent_name(ename);
			e1.setEvent_detail(edetails);
			AllOperation all = new AllOperation();
			int j = all.addevent(e1);
			 RequestDispatcher rd;
			 if(j>0)
			 {
				 req.setAttribute("msg", "Event Added into Database");
				 doGet(req, resp);
			 }
			 else
			 {
				req.setAttribute("msg", "Failed..Try Again");
				rd=req.getRequestDispatcher("admin_addevent.jsp");
				rd.forward(req, resp);
			 }
		}
		else if (ac.equals("update"))
		{
			int eid = Integer.parseInt(req.getParameter("eid"));
	
		 String ename=req.getParameter("ename");
		 String edetails=req.getParameter("edetails");
		 System.out.println(eid+" "+ename+" "+edetails);
		
		 Event e1 = new Event(); 
		 e1.setEid(eid);
		 e1.setEvent_name(ename);
		 e1.setEvent_detail(edetails);
		 AllOperation all =new AllOperation();
		 
		 int j=all.updateEvent(e1);
		 
		 RequestDispatcher rd;
		 if(j>0)
			 {
			 req.setAttribute("msg", "Service update into Database");
			 doGet(req, resp);
			 }
			 else
			 {
			req.setAttribute("msg", "Failed..Try Again");
			 doGet(req, resp);
			 }
			
		
		}
		
	}
	

}