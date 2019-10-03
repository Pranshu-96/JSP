<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.Connection, java.sql.DriverManager,java.sql.ResultSet,java.sql.Statement,java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String bid=request.getParameter("bid");
try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","mysql");
	    	Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from detail where bid='"+bid+"'");

			while(rs.next()){
				out.print("BookID:"+" "+rs.getString("bid")+" "+"Name:"+" "+rs.getString("name")+" "+"Authorinfo:"+" "+rs.getString("ainfo")+" "+"Cost:"+rs.getString("cost"));

			}
}catch(Exception p)
{
	out.print(p);
}
%>
</body>
</html>