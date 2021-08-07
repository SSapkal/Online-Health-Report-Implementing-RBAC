package com.login;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database 
{
	Connection con;
	public  Connection GetConnected()
	{
		String url="jdbc:mysql://localhost:3306/healthreport?autoReconnect=true&useSSL=false";
		String driver="com.mysql.jdbc.Driver";
		String user="root";
		String passwordd="Swap@123";
		try 
		{
			Class.forName(driver);
			con= DriverManager.getConnection(url,user,passwordd);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}