/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import model.Receptionist;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author user
 */
public class ReceptionistDAO extends DAO{

    public ReceptionistDAO() {
        super();
    }
    public boolean checkLogin(Receptionist user) {
        boolean result = false;
        String sql = "SELECT name,position FROM tblReceptionist WHERE username = ? AND password =  ? ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassWord());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setName(rs.getString("name"));
                user.setPosition(rs.getString("position"));
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
