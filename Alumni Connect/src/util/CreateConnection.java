package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CreateConnection {
     public Connection doConnection() {
    	 
    	 Connection cn=null;
    	 
    	 try {
			Class.forName("com.mysql.jdbc.Driver");
			cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/temp_db","root","");
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
    	 return cn;
		
	}
}
