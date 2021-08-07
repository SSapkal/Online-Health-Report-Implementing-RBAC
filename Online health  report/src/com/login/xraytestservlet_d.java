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
 * Servlet implementation class xraytestservlet
 */
public class xraytestservlet_d extends HttpServlet {
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
    	String testname=arg0.getParameter("testname");
    	String remark1=arg0.getParameter("remark1");
    	String remark2=arg0.getParameter("remark2");
    	String remark3=arg0.getParameter("remark3");
    	String dname=(String)session.getAttribute("user");
    	try 
		{
			Database db=new Database();
			Connection con=db.GetConnected();
			Statement st = con.createStatement();
			int flag=st.executeUpdate("insert into xray values('"+pname+"','"+date+"','"+testname+"','"+remark1+"','"+remark2+"','"+remark3+"','"+dname+"')");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
    	RequestDispatcher rd = arg0.getRequestDispatcher("X-ray.html");
		rd.forward(arg0, arg1);
    }

}
