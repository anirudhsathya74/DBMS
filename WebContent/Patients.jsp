<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Untitled</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alatsi">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alfa+Slab+One">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Almarai">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body style="border-color: rgba(33,37,41,0);">
    <h1 style="color: rgb(72,115,157);font-size: 40;font-family: Almarai, sans-serif;padding: 10px;">Hospital Database Management System</h1>
    <ul class="nav nav-tabs" style="font-size: 30px;font-family: Alatsi, sans-serif;background: #4760b6;color: #ffffff;">
         <li class="nav-item"><a class="nav-link" href="index.jsp" style="color: rgb(255,255,255);border-style: solid;border-color: rgba(0,0,0,0);border-right-color: #000000;">Doctors</a></li>
        <li class="nav-item"><a class="nav-link" href="Patients.jsp" style="color: rgb(255,255,255);border-style: solid;border-color: rgba(0,0,0,0);border-right-color: #000000;">Patients</a></li>
        <li class="nav-item"><a class="nav-link" href="Staffs.jsp" style="color: rgb(255,255,255);border-right-style: solid;border-right-color: #000000;">Staffs</a></li>
        <li class="nav-item"><a class="nav-link" href="Wards.jsp" style="border-right-color: #000000;color: rgb(255,255,255);">Wards</a></li>
        <li class="nav-item"><a class="nav-link" href="Appointments.jsp" style="color: rgb(255,255,255);border-right-style: solid;border-right-color: #000000;">Appointments</a></li>
        <li class="nav-item"><a class="nav-link" href="Inventory.jsp" style="color: rgb(255,255,255);border-right-style: solid;border-right-color: #000000;">Inventory</a></li>
    </ul>
    <a class="btn btn-primary" role="button" style="font-family: Almarai, sans-serif;font-size: 20px;margin-top: 20px;margin-bottom: 0px;margin-right: 0px;margin-left: 500px;" href="addNewPatient.jsp">Add New Patient</a>
    <div class="table-responsive" style="background: #ffffff;font-size: 20px;margin-top: 20px;margin-bottom: 10px;padding-right: 10px;padding-left: 10px;">
        <table class="table">
            <thead>
                <tr>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Patient ID</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Name</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Gender</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Age</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Address</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">phone</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Status</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Consulting Doctor</th>
                    <th style="background: #b9e4e1;border: 1px solid #000000 ;">Ward Number</th>
                </tr>
            </thead>
            <tbody style="border: 1px solid #000000 ;">
                <tr style="border: 1px solid #000000 ;"></tr>
                <tr style="border: 1px solid #000000 ;">
                 <%try{
	Connection con = Project.ConnectionProvider.getcon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patients");
	while(rs.next()){
		System.out.println(rs.getString(1)+" "+rs.getString(2));
	%>
                    <td style="border: 1px solid #000000 ;"><%=rs.getInt(1) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(2) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(3) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(4) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(5) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(6) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(7) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(8) %></td>
                    <td style="border: 1px solid #000000 ;"><%=rs.getString(9) %></td>
                </tr>
               <% }
                 }
	catch(Exception e){
		System.out.print("jsp: "+e);
	}
	%>
            </tbody>
        </table>
    </div>
    <form action="deletePatient.jsp" method="post">
        <div class="form-group"><label style="margin-left: 200px;margin-bottom: 0px;">Enter the Patient ID to be deleted<input class="form-control" name="doc_id" type="number">&nbsp;</label></div>
        <button class="btn btn-primary" type="submit" style="margin-left: 280px;">Delete</button></form>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>