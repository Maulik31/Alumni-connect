package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
			PreparedStatement ps = cn.prepareStatement("insert into user_reg values(?,?,?,?,?,?,?,?,?,?,?)");
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
			
			
			
			i = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
