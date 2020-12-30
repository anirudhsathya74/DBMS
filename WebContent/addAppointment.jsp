<%@ page import="Project.ConnectionProvider" %> 
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String doctor=request.getParameter("doctor");
String date=request.getParameter("date");

try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("select * from appointments");
	st.executeUpdate("insert into appointments values('"+name+"',"+Integer.parseInt(phone)+",'"+doctor+"','"+date+"')");
	response.sendRedirect("Appointments.jsp");
	
}
catch(Exception e)
{
	System.out.print(e.getMessage());
	}
%> 