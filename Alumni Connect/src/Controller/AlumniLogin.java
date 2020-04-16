package Controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AlumniOperation;

import Model.User;
import util.CreateConnection;

@WebServlet("/alumnilogin")
public class AlumniLogin extends HttpServlet {
  @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	    String email=req.getParameter("email");
		String pass=req.getParameter("password"); 
		
		User u1 = new User();
		u1.setEmail(email);
		u1.setPassword(pass);
		
	    AlumniOperation ao=new AlumniOperation();
	    boolean b = ao.checklogin(u1);
	    
	    
	   
		RequestDispatcher rd;
		if(b){
		HttpSession session=req.getSession();
		session.setAttribute("client",email);
			
			User ul = ao.getDataById(email);
			req.setAttribute("data", ul);
			rd=req.getRequestDispatcher("Userdata.jsp");
			rd.forward(req, resp);
	     	}
	else
		
	{
		req.setAttribute("error","wait for verification");
		rd=req.getRequestDispatcher("allogin.jsp");
		rd.forward(req, resp);
		
	}
//		{
//			HttpSession session = req.getSession(false);
//			if(session != null)
//			{
//				User ul = ao.getDataById((String)session.getAttribute("client"));
//				req.setAttribute("data", ul);
//				req.setAttribute("msg2", email);
//				rd=req.getRequestDispatcher("Userdata.jsp");
//				rd.forward(req, resp);
//			}
//			
//			req.setAttribute("msg3", "Invalid");
//			rd=req.getRequestDispatcher("allogin.jsp");
//			rd.forward(req, resp);
//          }
  }
}
