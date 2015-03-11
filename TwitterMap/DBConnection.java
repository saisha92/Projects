package dao;
import java.sql.*;
public class DBConnection {
public static Connection createConnection() throws Exception
{
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");
System.out.println("2");
String url="jdbc:mysql://samplemysql.cm0tpmhapx9k.us-east-1.rds.amazonaws.com:3306/tweetdb";
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
}
catch(SQLException e){
e.printStackTrace();
}
}
}
}
	

