package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AlumniOperation;
import DAO.StudentOperation;
import Model.User;
import Model.student;

@WebServlet("/studentlogin")
public class StudentLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  String email=req.getParameter("username");
			String pass=req.getParameter("pass"); 
			student st = new student();
			st.setS_email(email);
			st.setS_password(pass);
			
			StudentOperation so= new StudentOperation(); 
		    AlumniOperation ao=new AlumniOperation();
		    boolean b = so.checklogin(st);
		    
		    RequestDispatcher rd;
			if(b){
			HttpSession session=req.getSession();
			session.setAttribute("student",email);
				student sd= so.getStuentDataById(email);
				
				List<User> us=ao.getAllUser();
				req.setAttribute("data", sd);
				req.setAttribute("alumni",us);
				rd=req.getRequestDispatcher("studentdash.jsp");
				rd.forward(req, resp);
		     	}
		else
			
		{
			req.setAttribute("error","wait for verification");
			rd=req.getRequestDispatcher("slogin.jsp");
			rd.forward(req, resp);
			
		}
			
	}

}
