package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class DoctorLoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException 
	{
		arg1.setContentType("text/html");
		String usr=arg0.getParameter("username");
		String pwd=arg0.getParameter("password");
		
		
		try 
		{
			
			Database db=new Database();
			Connection con=db.GetConnected();
			Statement st = con.createStatement();
	        ResultSet rs = st.executeQuery("select * from doctor");
	        int flag=0;
	        while(rs.next())
	        {
				if(usr.equals(rs.getString("user")) && pwd.equals(rs.getString("passwd"))) 
				{
					HttpSession session=arg0.getSession();
					session.setAttribute("user", usr);
					RequestDispatcher rd = arg0.getRequestDispatcher("profile_d.jsp");
					rd.forward(arg0, arg1);
					flag=1;
				}
			}
	        if(flag==0)
	        {
				PrintWriter pw=arg1.getWriter();
				pw.println("<h2 style=\"color:red\">Unsuccessfull Login</h2>");
				RequestDispatcher rd = arg0.getRequestDispatcher("login_d.html");
				rd.include(arg0, arg1);
	        }
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}	
	}
}
