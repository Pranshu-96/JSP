<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession,java.sql.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String userid=request.getParameter("username");
String password=request.getParameter("password");

HttpSession sesion=request.getSession();
Date createTime=new Date(sesion.getCreationTime());
Date lastAccessTime= new Date(sesion.getLastAccessedTime());

String title="Welcome back";
Integer visitCount=new Integer(0);
String visitCountKey=new String("visitCount");
String userIDKey=new String("user ID");
String userID=new String("ABCD");

if(sesion.isNew()) {
	title="Welcome new User";
	sesion.setAttribute(userIDKey, userID);
}else {
	visitCount=(Integer)sesion.getAttribute(visitCountKey);
	visitCount=visitCount+1;
	userID=(String)sesion.getAttribute(userIDKey);
}
sesion.setAttribute(visitCountKey, visitCount);

out.print(title);
%>
</body>
</html>