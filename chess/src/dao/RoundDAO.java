/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Round;
/**
 *
 * @author user
 */
public class RoundDAO extends DAO{

    public RoundDAO() {
        super();
    }
    public ArrayList<Round> getRound(){
        ArrayList<Round> result = new ArrayList<>();
        String sql = "SELECT * FROM tblRound";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
 
            while(rs.next()){
                Round rd = new Round();
                rd.setId(rs.getInt("id"));
                rd.setNameRound(rs.getString("nameRound"));
                rd.setDateTime(rs.getDate("time"));
                result.add(rd);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
}
