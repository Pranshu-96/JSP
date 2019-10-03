<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%  int n=Integer.parseInt(request.getParameter("input"));
	
	if(n<10){
		response.sendRedirect("page1.jsp");
	}else if(n>=10&&n<99){
		response.sendRedirect("page2.jsp");
	}else{
		response.sendRedirect("errorpage.jsp");
	}
%>
</body>
</html>