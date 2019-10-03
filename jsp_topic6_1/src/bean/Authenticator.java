package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;



public class Authenticator {
	public String check(user u) {
		String username=u.getUsername();
		String password=u.getpassword();
		boolean flag=false;
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "mysql");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from users");
			while(rs.next()) {
				if(username.equals(rs.getString(1))&&password.equals(rs.getString(2)))
				{
					
					flag=true;
					
					return("Success.jsp");
				}
			}
//			if(flag==false) {
//				return("errorpage.jsp");
//			}
	    }catch(Exception p)
	    {
	    	p.printStackTrace();
	    }
	    return("errorpage.jsp");
		
	}
	
	
}
