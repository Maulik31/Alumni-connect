package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AllOperation;

@WebServlet("/adminmail")
public class AdminMailSend extends HttpServlet {
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String to= req.getParameter("mailfor");
		String sub= req.getParameter("subject");
		String msg=req.getParameter("msg");
		
		AllOperation ao = new AllOperation();
		ao.send(to, sub, msg);
		req.getRequestDispatcher("admin_viewalumni.jsp").forward(req, resp);
	
}
}
