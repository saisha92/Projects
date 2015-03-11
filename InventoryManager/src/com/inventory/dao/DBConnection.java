package com.inventory.dao;


import java.sql.*;
public class DBConnection {
	public static Connection createConnection() throws Exception
	 {   System.out.println("Conn.........");
			 Connection conn=null;
		 Class.forName("oracle.jdbc.driver.OracleDriver");
		 String url="Jdbc:oracle:thin:@172.24.137.30:1521:ora10g";
		 String uname="";
		 String pwd="";
		 conn=DriverManager.getConnection(url,uname,pwd);
		 return conn;
	 }
	public static void closeConnection(Connection con)
	   {
		   if(con!=null)
		   {
			   try{
				   con.close();
			   }catch(SQLException e){
			   e.printStackTrace();
			   }
		   }
	   }
	 

}
