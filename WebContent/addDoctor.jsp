<%@ page import="Project.ConnectionProvider" %> 
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String speciality=request.getParameter("speciality");
String consultation=request.getParameter("consultation");
String salary=request.getParameter("salary");
try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	System.out.println(name);
	ResultSet rs = st.executeQuery("select * from doctor");
	rs.last();
	int id = rs.getInt(1) + 1001;
	st.executeUpdate("insert into Doctor values("+id+",'"+name+"',"+Integer.parseInt(phone)+",'"+speciality+"','"+consultation+"',"+Integer.parseInt(salary)+")");
	response.sendRedirect("index.jsp");
}
catch(Exception e)
{
	System.out.print(e.getMessage());
	}
%>  