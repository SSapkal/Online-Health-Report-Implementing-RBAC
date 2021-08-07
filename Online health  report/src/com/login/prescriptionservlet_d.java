package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class prescriptionservlet
 */
public class prescriptionservlet_d extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    @Override
    protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException 
    {
    	HttpSession session=arg0.getSession(false);
    	String pname=arg0.getParameter("pname");
    	String date=arg0.getParameter("date");
    	String medicine=arg0.getParameter("medicine");
    	String dose=arg0.getParameter("dose");
    	String diagnosis=arg0.getParameter("diagnosis");
    	String instructions=arg0.getParameter("instructions");
    	String dname=(String)session.getAttribute("user");
    	try 
		{
			Database db=new Database();
			Connection con=db.GetConnected();
			Statement st = con.createStatement();
		
			int flag=st.executeUpdate("insert into prescription values('"+pname+"','"+date+"','"+medicine+"','"+dose+"','"+diagnosis+"','"+instructions+"','"+dname+"')");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    	RequestDispatcher rd = arg0.getRequestDispatcher("prescription.html");
		rd.forward(arg0, arg1);
    }

}
