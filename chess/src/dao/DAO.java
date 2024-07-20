/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class DAO {

    public static Connection con;

    public DAO() {
        if (con == null) {
            String dbUrl
                    = "jdbc:sqlserver://DUCLOC\\SQLEXPRESS;databaseName=CNPM;autoReconnect=true&useSSL=false;encrypt=false;trustServerCertificate=false;";
            String dbClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, "sa", "Tdl@20102003");
                System.out.println("Ket noi thanh cong");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}



//
//public static void main(String[] args) {
//        if (con == null) {
//            String dbUrl
//                    = "jdbc:sqlserver://DUCLOC\\SQLEXPRESS;databaseName=CNPM;autoReconnect=true&useSSL=false;encrypt=false;trustServerCertificate=false;";
//            String dbClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//            try {
//                Class.forName(dbClass);
//                con = DriverManager.getConnection(dbUrl, "sa", "Tdl@20102003");
//                System.out.println("Ket noi thanh cong");
//                Statement stmt = con.createStatement();
//                String query = "SELECT * FROM student";
//                ResultSet rs = stmt.executeQuery(query);
//
//                // Duyệt qua kết quả và in ra thông tin của từng sinh viên
//                while (rs.next()) {
//                    int id = rs.getInt("id");
//                    String name = rs.getString("name");
//                    int age = rs.getInt("age");
//                    String gender = rs.getString("gender");
//                    System.out.println("ID: " + id + ", Name: " + name + ", Age: " + age + ", Gender: " + gender);
//                }
//
//                // Đóng ResultSet, Statement và Connection sau khi sử dụng xong
//                rs.close();
//                stmt.close();
//                con.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//    }
