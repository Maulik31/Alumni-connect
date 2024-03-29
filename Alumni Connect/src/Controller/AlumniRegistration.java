package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AllOperation;
import DAO.AlumniOperation;
import Model.User;

@WebServlet("/areg")
public class AlumniRegistration extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	 String name=req.getParameter("name");
	 String enno=req.getParameter("enno");
	 String gn=req.getParameter("gn");
     String dob=req.getParameter("dob");
	 String pyear=req.getParameter("pyear");
	 String institute=req.getParameter("institute");
	 String course =req.getParameter("course");
	 String mobileno =req.getParameter("mobileno");
	 String email=req.getParameter("email");
	 String password=req.getParameter("password");
	 String occupation=req.getParameter("occupation");
	 String city=req.getParameter("city");
	 
	 
	 User u1=new User();
	 u1.setName(name);
	 u1.setEnno(enno);
	 u1.setDob(dob);
	 u1.setP_year(pyear);
	 u1.setGender(gn);
	 u1.setInstitute(institute);
	 u1.setCourse(course);
	 u1.setOccupation(occupation);
	 u1.setCity(city);
	 u1.setMono(mobileno);
	 u1.setEmail(email);
	 u1.setPassword(password);
	 
	 AlumniOperation alumniOperation =new AlumniOperation();
	 int i=alumniOperation.adduser(u1);

		if(i>0)
		{   
			
			req.setAttribute("error", "Registration Successfull.\n Wait for admin's verification");
			RequestDispatcher rq=req.getRequestDispatcher("allogin.jsp");
			rq.forward(req, resp);
			
			
			
			    String to = email;
		        String subject ="Alumini Tracking System"; 
		        String message = "Hello "+name+"\n You have successfully registered. \n Please Wait for Admin's Verification. \n\n  ";
		        
		        AllOperation al=new AllOperation();
		        al.send(to,subject, message);
		        
		}
		
	}
	

}
