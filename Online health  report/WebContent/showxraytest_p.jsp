<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>X-ray test</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="table1.css">
 <style type="text/css">
  body
  {
    background-repeat: no-repeat;
    background-size: 100%
  }
  table{
  margin-top:5%;
  }
  tbody{
  background-color: #fff;
  OPacity:0.8;
  }
  td
  {
  color:#000;
  	font-size:17px;
  	 text-align="center";
 	 height: 30px;
 	 width: 60px;
 	   z-index:999;
 	 
  }
  </style>
</head>
<body style="background-image:url(medical-563427_960_720.jpg);">
	<ul><li> <a href="profile_p.jsp" >Home </a></li>
  <li><a href="profile_p.jsp" >Profile </a></li>
  <li><a href="showprescription_p.jsp" > Prescriptions </a></li>
  <li>
    Tests
    <ul>
      <li><a href="showbloodtest_p.jsp" >Blood Tests </a></li>
      <li><a href="showurinetest_p.jsp" >Urine Tests </a></li>
      <li><a href="showxraytest_p.jsp" >X-Ray Tests </a></li>
    </ul>
  </li>
  
 <li><a href="logout_p.jsp" >Logout </a></li>
	</ul>
	<br><br><br>
	
	<br><br><br>
	
	<br><br><br>
		<h1 align="center">X-Ray Test Report</h1>
		<table id="keywords" cellspacing="0" cellpadding="0">
		    <thead>
		      <tr>
		        <th><span>Dr Name</span></th>
		        <th><span>Date</span></th>
		        <th><span>Testname</span></th>
		        <th><span>Remark1</span></th>
		        <th><span>Remark2</span></th>
		        <th><span>Remark3</span></th>
		      </tr>
		    </thead>
		<%
			try
			{
				session=request.getSession(false);
				
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/healthreport?autoReconnect=true&useSSL=false";
				String username="root";
				String password="Swap@123";
				String s=(String)session.getAttribute("user");
				String query="select * from xray where patientid='"+s+"'";
				Connection conn=DriverManager.getConnection(url,username,password);
				Statement stmt=conn.createStatement();
				ResultSet rs=stmt.executeQuery(query);
				while(rs.next())
				{
		%>
				<tbody>
				   	<tr>
				   		<td><%out.print(rs.getString(7)); %></td>
				   		<td><%out.print(rs.getString(2)); %></td>
				    	<td><%out.print(rs.getString(3)); %></td>
				    	<td><%out.print(rs.getString(4)); %></td>
				   		<td><%out.print(rs.getString(5)); %></td>
				    	<td><%out.print(rs.getString(6)); %></td>
				    </tr>
				   </tbody>
		</table>
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