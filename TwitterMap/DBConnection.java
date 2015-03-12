package dao;
import java.sql.*;
public class DBConnection {
public static Connection createConnection() throws Exception
{
Connection conn=null;
Class.forName("com.mysql.jdbc.Driver");
String url="";
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
	

