package com.login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
public class PatientRegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException 
    {
    	String name=arg0.getParameter("name");
    	String email=arg0.getParameter("email");
    	String dob=arg0.getParameter("dob");
    	String gender=arg0.getParameter("gender");
    	String bdgroup=arg0.getParameter("bdgroup");
    	String mobno=arg0.getParameter("mobno");
    	String address=arg0.getParameter("address");
    	String usr=arg0.getParameter("usr");
    	String passwd=arg0.getParameter("passwd");
		try 
		{
			Database db=new Database();
			Connection con=db.GetConnected();
			Statement st = con.createStatement();
			int flag=st.executeUpdate("insert into user values('"+name+"','"+email+"','"+dob+"','"+gender+"','"+bdgroup+"','"+mobno+"','"+address+"','"+usr+"','"+passwd+"')");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

    	RequestDispatcher rd=arg0.getRequestDispatcher("login_p.html");
    	rd.forward(arg0, arg1);
    }
}
