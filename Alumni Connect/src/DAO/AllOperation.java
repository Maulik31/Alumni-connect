package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

import Model.Event;
import util.CreateConnection;

public class AllOperation {
	static CreateConnection con = null;
	static Connection cn = null;

	static {
		con = new CreateConnection();
		cn = con.doConnection();
	}

	public void send(String to, String sub, String msg) {

		final String user="170510101048@paruluniversity.ac.in";
		final String pass="Pumis@48";
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pass);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(sub);
			message.setText(msg);

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
   public int addevent(Event e1) {
	   int i = 0;
		
		try {
			Statement st=cn.createStatement();
			i=st.executeUpdate("insert into event_master values(0,'"+e1.getEvent_name()+"','"+e1.getEvent_detail()+"')");
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i;
    }
   
   public ArrayList<Event> getAllEvent()
	{
		ArrayList<Event> al =new ArrayList<>();
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from event_master");
				while(rs.next())
				{
						Event edata = new Event();
						   
						 edata.setEid(rs.getInt(1));
						 edata.setEvent_name(rs.getString(2));
						 edata.setEvent_detail(rs.getString(3));	
						 al.add(edata);
	                 
						}
			     
	    	}	
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return al;
	}
   
   public Event getEventById(int id ) 
	{
	 Event edata= null;
		try {
			Statement st =cn.createStatement();
			ResultSet rs =st.executeQuery("select * from event_master where E_id='"+id+"'");
			
			while(rs.next())
			{
				edata=new Event();
				edata.setEid(rs.getInt(1));
				edata.setEvent_name(rs.getString(2));
				edata.setEvent_detail(rs.getString(3));
				}
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return edata ;
		
	}
	
   
   public int updateEvent(Event edata)
	{
		int i=0;
		
		try {
			PreparedStatement ps =cn.prepareStatement("update event_master set Event_name=?,Event_detail=? where E_id=?");
			
			ps.setString(1, edata.getEvent_name());
			ps.setString(2, edata.getEvent_detail());
			ps.setInt(3, edata.getEid());
			
			i= ps.executeUpdate();
		    } 
		catch (SQLException e) 
			{
				
				e.printStackTrace();
			}	
		return i;
		
	 }
   public int deleteEvent(int id)
	{
		int i=0;
		
		Statement st;
		try 
		{
			st = cn.createStatement();
			i = st.executeUpdate("delete from event_master where E_id='"+id+"'");
		} catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		return i;
	
   }
	

   
   
}
