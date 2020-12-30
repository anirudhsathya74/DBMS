<%@ page import="Project.ConnectionProvider" %> 
<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String phone=request.getParameter("phone");
String gender=request.getParameter("gender");
String department=request.getParameter("department");
String shift=request.getParameter("shift");
String salary=request.getParameter("salary");

try{
	Connection con=ConnectionProvider.getcon();
	Statement st=con.createStatement();
	ResultSet rs = st.executeQuery("select * from staffs");
	rs.last();
	int id = rs.getInt(1) + 3001;
	st.executeUpdate("insert into Staffs values("+id+",'"+name+"',"+Integer.parseInt(phone)+",'"+gender+"','"+department+"','"+shift+"','"+salary+"')");
	response.sendRedirect("Staffs.jsp");
}
catch(Exception e)
{
	System.out.print(e.getMessage());
	}
%> 