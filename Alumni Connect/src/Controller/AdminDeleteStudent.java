package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentOperation;

@WebServlet("/deleteStudent")
public class AdminDeleteStudent extends HttpServlet{
 @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 int id =Integer.parseInt(req.getParameter("id"));
	 StudentOperation so = new StudentOperation();
	 int i =so.deleteStudent(id);
	 
	 if(i>0)
	 {
		 RequestDispatcher rd = req.getRequestDispatcher("ViewStudentController");
		 rd.forward(req, resp);
	 }
}
}