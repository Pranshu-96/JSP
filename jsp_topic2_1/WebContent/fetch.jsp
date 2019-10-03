<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection, java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fetch</title>
</head>
<body>
<% String eid=request.getParameter("eid");
try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspemployee","root","mysql");
	    	Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from emp where ID='"+eid+"'");

			while(rs.next()){
				out.print("EmployeeID:"+" "+rs.getString("ID")+" "+"Name:"+" "+rs.getString("name")+" "+"YOE:"+" "+rs.getString("YOE")+" "+"Wages:"+rs.getString("wages")+" "+"Address:"+rs.getString("address"));

			}
}catch(Exception p)
{
	out.print(p);
}
			%>
</body>
</html>