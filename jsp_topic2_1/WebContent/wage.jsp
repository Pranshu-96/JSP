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
<% String eid=request.getParameter("eid");
   String name=request.getParameter("name");
   String address=request.getParameter("address");
   int yoe=Integer.parseInt(request.getParameter("yoe"));
   int hw=Integer.parseInt(request.getParameter("hw"));
   int rate=0;
   double wage;
   String wages;
   
   if(yoe<2){
	   rate=20;
   }else if(yoe>2&&yoe<5){
	   rate=50;
   }else if(yoe>=5){
	   rate=90;
   }
   
   if(hw>40){
	   wage=(40*rate)+(hw-40)*1.5*rate;
   }else{
	   wage=hw*rate;
   }
   wages=Double.toString(wage);
   out.print(wage+" "+rate);
   try {
	    	Class.forName("com.mysql.jdbc.Driver");
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspemployee","root","mysql");
//			Statement stmt=con.createStatement();
			PreparedStatement st=con.prepareStatement("insert into emp values(?,?,?,?,?)");
			st.setString(1, request.getParameter("eid"));
			st.setString(2, request.getParameter("name"));
			st.setString(3, request.getParameter("yoe"));
			st.setString(4, wages);
			st.setString(5, request.getParameter("address"));
			

			
			st.executeUpdate();
			
			st.close();
			con.close();
			out.println("<html><body><b>Successfully Inserted"+ "</b></body></html>");
			

//			ResultSet rs=stmt.executeQuery("insert into addtraining(trainingid ,trainingname ,startdate ,enddate ,trainingmode ,BU ,CID)values(trainingid ,trainingname ,startdate ,enddate ,trainingmode ,BU ,CID" );
//			
		}catch(Exception p)
	    {
	    	out.print(p);
	    }
//    boolean flag=false;
//    try {
//    	Class.forName("com.mysql.jdbc.Driver");
// 		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspemployee","root","mysql");
// 		Statement stmt=con.createStatement();
// 		ResultSet rs=stmt.executeQuery("insert into emp(ID,name,YOE,wages,address) values('eid','name','yoe','wage','address')");
//    }catch(Exception p)
//    {
//    	out.print(p);
//    }
   %>
</body>
</html>