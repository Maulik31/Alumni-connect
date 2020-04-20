package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AllOperation;

@WebServlet("/alumnimail")
public class MailCommunicationA extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String from = req.getParameter("senderid");
		String to= req.getParameter("mailfor");
		String sub= req.getParameter("subject");
		String msg=req.getParameter("msg");
		
		AllOperation ao= new AllOperation();
		ao.Mailsend(from, to, sub, msg);
			
		req.setAttribute("sent", "Your Email sucssfully Sent");
		req.getRequestDispatcher("Userdata.jsp").forward(req, resp);
		
		
	}
	

}
