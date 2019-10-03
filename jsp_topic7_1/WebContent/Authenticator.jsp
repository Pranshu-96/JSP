<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String username=request.getParameter("username");
	String password=request.getParameter("password");
	
	Cookie cookie=new Cookie("userid",username);
	Cookie cookie1=new Cookie("pass",password);
	response.addCookie(cookie);
	response.addCookie(cookie1);
	
	response.sendRedirect("validate.jsp");
			%>
</body>
</html>