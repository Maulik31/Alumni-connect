package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
	
import Model.student;
import util.CreateConnection;

public class StudentOperation {
	static CreateConnection con=null;
	static Connection cn=null;
	
	static
	{
		con=new CreateConnection();
		cn=con.doConnection();
	}
	public ArrayList<student> getAllStudent()
	{
		ArrayList<student> al =new ArrayList<>();
		Statement st;
		try {
				st = cn.createStatement();
				ResultSet rs = st.executeQuery("select * from student_master ");
				while(rs.next())
				{
					     student sd=new student();
					       sd.setS_id(rs.getInt(1));
					       sd.setS_name(rs.getString(2));
					       sd.setS_gender(rs.getString(3));
					       sd.setS_dob(rs.getString(4));
					       sd.setS_institute(rs.getString(5));
					       sd.setS_course(rs.getString(6));
					       sd.setS_mobile(rs.getString(7));
					       sd.setS_email(rs.getString(8));
					       sd.setS_password(rs.getString(9));
					       
					     al.add(sd);		}
			     
	    	}	
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		
		return al;
	}
	
	
	
	public student getStuentDataById(String email) {

		student sd= null;
		try {
			Statement st =cn.createStatement();
			ResultSet rs =st.executeQuery("select * from student_master where email='"+email+"'");
			
			while(rs.next())
			{  
				   sd=new student();
				   sd.setS_id(rs.getInt(1));
			       sd.setS_name(rs.getString(2));
			       sd.setS_gender(rs.getString(3));
			       sd.setS_dob(rs.getString(4));
			       sd.setS_institute(rs.getString(5));
			       sd.setS_course(rs.getString(6));
			       sd.setS_mobile(rs.getString(7));
			       sd.setS_email(rs.getString(8));
			       sd.setS_password(rs.getString(9));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return sd;
	}
	
	
	
	public int deleteStudent(int id) 
	{
		int i=0;
		try {
			Statement st=cn.createStatement();
			 i=st.executeUpdate("delete from student_master where s_id='"+id+"'");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 return i;
	}

	
	

	
	
}
