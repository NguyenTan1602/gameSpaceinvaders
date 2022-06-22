/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    public static Connection conn =null;
     public static String userID ="";
     public static String name ="";
     public static String getConnection(){
        
         String connString= "jdbc:sqlserver://DESKTOP-I9E85NO\\SQLEXPRESS;databaseName=Game;user=Admin;password=123";
         String kq="";
         try {
             conn = DriverManager.getConnection(connString);
         } catch (SQLException ex) {
             kq="Lỗi kết nối CSDL : " +ex;
         }
         return kq;
     }
    /*
    public static Connection getConnection() {
		try {
			Connection connect;
			String conectString = "jdbc:sqlserver://LAPTOP-V3A34PN7\\SQLEXPRESS; databasename=Game;user=sa;password=123";
			connect = DriverManager.getConnection(conectString);

			return connect;

		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("Lỗi: " + e);
		}
		return null;

	}
*/
}
