package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentOperation;
import Model.student;

@WebServlet("/ViewStudentsController")
public class ViewStudentsController extends HttpServlet {
            @Override
       
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            	StudentOperation op= new StudentOperation();
        		ArrayList<student> all =op.getAllStudent();
        		
        		
        		req.setAttribute("StudentData", all);
        		RequestDispatcher rd = req.getRequestDispatcher("admin_viewstudent.jsp");
        		rd.forward(req, resp);

        }
}
