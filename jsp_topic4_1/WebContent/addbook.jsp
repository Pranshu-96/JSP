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
   String name=request.getParameter("name");
   String ainfo=request.getParameter("ainfo");
   String cost=request.getParameter("cost");
   try {
   	Class.forName("com.mysql.jdbc.Driver");
   	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","mysql");
   	PreparedStatement st=con.prepareStatement("insert into detail values(?,?,?,?)");
	st.setString(1, request.getParameter("bid"));
	st.setString(2, request.getParameter("name"));
	st.setString(3, request.getParameter("ainfo"));
	st.setString(4, request.getParameter("cost"));
	

	
	st.executeUpdate();
	
	st.close();
	con.close();
	out.println("<html><body><b>Successfully Inserted"+ "</b></body></html>");
	

}catch(Exception p)
{
	out.print(p);
}
   %>
</body>
</html>