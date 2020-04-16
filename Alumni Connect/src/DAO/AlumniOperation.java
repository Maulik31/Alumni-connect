package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import Model.User;
import util.CreateConnection;

public class AlumniOperation {
	static CreateConnection con=null;
	static Connection cn=null;
	
	static
	{
		con=new CreateConnection();
		cn=con.doConnection();
	}
	
	public int adduser(User u1) 
	{
		int i=0;
		try {
			PreparedStatement ps = cn.prepareStatement("insert into user_reg values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setString(2, u1.getName());
			ps.setString(3,u1.getEnno());
			ps.setString(4, u1.getGender());
			ps.setString(5,u1.getDob());
			ps.setString(6,u1.getP_year());
			ps.setString(7,u1.getInstitute());
			ps.setString(8,u1.getCourse());
			ps.setString(9,u1.getMono());
			ps.setString(10,u1.getEmail());
			ps.setString(11,u1.getPassword());
			ps.setBoolean(12, false);
			
			
			
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}

	public ArrayList<User> getAllUser()
	{
		ArrayList<User> al =new ArrayList<>();
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from user_reg ");
				while(rs.next())
				{
						 User us = new User();
						
				
							us.setId(rs.getInt(1));
							us.setName(rs.getString(2));
							us.setEnno(rs.getString(3));
							us.setGender(rs.getString(4));
							us.setDob(rs.getString(5));
							us.setP_year(rs.getString(6));
							us.setInstitute(rs.getString(7));
							us.setCourse(rs.getString(8));
							us.setMono(rs.getBigDecimal(9).toString());
							us.setEmail(rs.getString(10));
							us.setPassword(rs.getString(11));
							us.setStatus(rs.getBoolean(12));
							
							al.add(us);
						}
			     
	    	}	
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		
		
		
		
		return al;
	}
	
	
	
	public Boolean checklogin(User u1) {
		
			boolean b=false;
			try {
				Statement st =cn.createStatement();
				ResultSet rs=st.executeQuery("select * from user_reg where email='"+u1.getEmail()+"' and password='"+u1.getPassword()+"' and status = 1 ");
				
				while(rs.next())
					{
						int status = rs.getInt("status");
						if(status>0)
						{
							b=true;
						}
						
					}
				System.out.println(b);
				System.out.println("verification under Procces");	
				
		     	} 
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}
			return b;
	}
	
	public int updateStatus(int id) 
	{
		int i=0;
		
		try {
			PreparedStatement ps =cn.prepareStatement("update user_reg set status=? where u_id=?");
			ps.setBoolean(1,true);
			ps.setInt(2, id);
			
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return i;
	}
	
	public int deleteAlumni(int id) 
	{
		int i=0;
		try {
			Statement st=cn.createStatement();
			 i=st.executeUpdate("delete from user_reg where u_id='"+id+"'");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 return i;
	}

	public User getDataById(String email) {

		User us= null;
		try {
			Statement st =cn.createStatement();
			ResultSet rs =st.executeQuery("select * from user_reg where email='"+email+"'");
			
			while(rs.next())
			{  
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEnno(rs.getString(3));
				us.setGender(rs.getString(4));
				us.setDob(rs.getString(5));
				us.setP_year(rs.getString(6));
				us.setInstitute(rs.getString(7));
				us.setCourse(rs.getString(8));
				us.setMono(rs.getBigDecimal(9).toString());
				us.setEmail(rs.getString(10));
				us.setPassword(rs.getString(11));
				us.setStatus(rs.getBoolean(12));
			}
		} 
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}
		
		return us;
	}
	
	
}
