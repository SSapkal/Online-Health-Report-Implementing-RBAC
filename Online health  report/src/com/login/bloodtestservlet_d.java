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
 * Servlet implementation class bloodtestservlet
 */
public class bloodtestservlet_d extends HttpServlet {
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
    	float hb=Float.parseFloat(arg0.getParameter("hb"));
    	float wbc=Float.parseFloat(arg0.getParameter("wbc"));
    	float rbc=Float.parseFloat(arg0.getParameter("rbc"));
    	String diagnosis=arg0.getParameter("diagnosis");
    	String instructions=arg0.getParameter("instructions");
    	String dname=(String)session.getAttribute("user");
    	try 
		{
			Database db=new Database();
			Connection con=db.GetConnected();
			Statement st = con.createStatement();
			int flag=st.executeUpdate("insert into bloodtest values('"+pname+"','"+date+"','"+hb+"','"+wbc+"','"+rbc+"','"+diagnosis+"','"+instructions+"','"+dname+"')");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    	RequestDispatcher rd = arg0.getRequestDispatcher("bloodtest.html");
		rd.forward(arg0, arg1);
	}

}
