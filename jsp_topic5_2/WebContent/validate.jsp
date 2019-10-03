<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection, java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,java.sql.PreparedStatement" %>
    <%@page errorPage = "errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String username=request.getParameter("username");
	String password=request.getParameter("password");
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
				
				out.print("Correct Username and Password");
			}
		}
		if(flag==false) {
			//throw new NullPointerException();
 			response.sendRedirect("errorpage.jsp");
		}
    }catch(Exception p)
    {
    	out.print(p);
    }
	%>
</body>
</html>