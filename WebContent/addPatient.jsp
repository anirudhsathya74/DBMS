<%@ page import="Project.ConnectionProvider" %> 
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String age=request.getParameter("age");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String doctor=request.getParameter("doctor");
String ward=request.getParameter("ward");

try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("select * from patients");
	rs.last();
	int id = rs.getInt(1) + 2001;
	st.executeUpdate("insert into Patients values("+id+",'"+name+"','"+gender+"','"+age+"','"+address+"',"+Integer.parseInt(phone)+",'Admitted','"+doctor+"','"+ward+"')");
	response.sendRedirect("Patients.jsp");
}
catch(Exception e)
{
	System.out.print(e.getMessage());
	}
%> 