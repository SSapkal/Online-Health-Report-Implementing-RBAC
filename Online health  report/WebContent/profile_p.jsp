<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="table.css">
</head>
<body style="background-image:url(medical-563427_960_720.jpg);">
	<form method="post">
	<ul><li> <a href="profile_p.jsp" >Home </a></li>
  <li><a href="profile_p.jsp" >Profile </a></li>
  <li><a href="showprescription_p.jsp" > Prescriptions </a></li>
  <li>
    <a href="#">Tests</a>
    <ul>
      <li><a href="showbloodtest_p.jsp" >Blood Tests </a></li>
      <li><a href="showurinetest_p.jsp" >Urine Tests </a></li>
      <li><a href="showxraytest_p.jsp" >X-Ray Tests </a></li>
    </ul>
  </li>
  
 <li><a href="logout_p.jsp" >Logout </a></li>
	</ul>
	<br><br><br><br><br><br><br><br>
	<%
			try
			{
				session=request.getSession(false);
				response.setContentType("text/html");
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/healthreport?autoReconnect=true&useSSL=false";
				String username="root";
				String password="Swap@123";
				String s=(String)session.getAttribute("user");
				String query="select * from user where user='"+s+"'";
				Connection conn=DriverManager.getConnection(url,username,password);
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				while(rs.next())
				{
		%>
		<h1 align="center">Personal Details</h1>
		<table class="table-fill">
		<tbody class="table-hover">
		<tr>
			<td class="text-left">User Id</td>
			<td class="text-left"><%out.print(rs.getString(8)); %></td>
		</tr>
		<tr>
			<td class="text-left">Name</td>
			<td class="text-left"><%out.print(rs.getString(1)); %></td>
		</tr>
		<tr>
			<td class="text-left">Email</td>
			<td class="text-left"><%out.print(rs.getString(2)); %></td>
		</tr>
		<tr>
			<td class="text-left">Date of Birth</td>
			<td class="text-left"><%out.print(rs.getString(3)); %></td>
		</tr>
		<tr>
			<td class="text-left">Gender</td>
			<td class="text-left"><%out.print(rs.getString(4)); %></td>
		</tr>
		<tr>
			<td class="text-left">Blood Group</td>
			<td class="text-left"><%out.print(rs.getString(5)); %></td>
		</tr>
		<tr>
			<td class="text-left">Mobile No</td>
			<td class="text-left"><%out.print(rs.getString(6)); %></td>
		</tr>
		<tr>
			<td class="text-left">Address</td>
			<td class="text-left"><%out.print(rs.getString(7)); %></td>
		</tr>
		</tbody>
		</table>
		</form>
		<%
			}
				rs.close();
				stmt.close();
				conn.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
				   	
		
</body>
</html>