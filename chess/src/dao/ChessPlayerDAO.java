/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.ChessPlayer;
/**
 *
 * @author user
 */
public class ChessPlayerDAO extends DAO{

    public ChessPlayerDAO() {
        super();
    }
    public ArrayList<ChessPlayer> getChessPlayerByRound(int idRound) {
        ArrayList<ChessPlayer> result = new ArrayList<>();
        String sql_check =  "SELECT COUNT(*) AS match_count\n" +
                            "FROM tblMatch m\n" +
                            "JOIN tblChess_Match c ON c.tblMatchId = m.id\n" +
                            "JOIN tblRound r ON m.tblRoundid = r.id\n" +
                            "WHERE r.id = ?;";
        
        String sql = "SELECT cp.id, cp.name ,cp.dob ,cp.[national] ,SUM(cm.pointGain) AS total_point\n" +
                    "FROM tblChessPlayer cp\n" +
                    "JOIN tblChess_Match cm ON cp.id = cm.tblChessPlayerid\n" +
                    "JOIN tblMatch m ON cm.tblMatchId = m.id\n" +
                    "JOIN tblRound r ON m.tblRoundid = r.id\n" +
                    "WHERE r.id <= ?\n" +
                    "GROUP BY cp.id, cp.name,cp.dob ,cp.[national]" + 
                    "ORDER BY total_point DESC;";
        
        try{
            PreparedStatement ps = con.prepareStatement(sql_check);
            ps.setInt(1, idRound);
            ResultSet rs = ps.executeQuery();
            int numRound = 0;
            while (rs.next()) {
                numRound = Integer.parseInt(rs.getString("match_count"));
            }
            if(numRound!=0){
                ps = con.prepareStatement(sql);
                ps.setInt(1, idRound);
                rs = ps.executeQuery();

                while (rs.next()) {
                    ChessPlayer chessPlayer = new ChessPlayer();
                    chessPlayer.setId(rs.getInt("id"));
                    chessPlayer.setName(rs.getString("name"));
                    chessPlayer.setDob(rs.getDate("dob"));
                    chessPlayer.setNational(rs.getString("national"));
                    chessPlayer.setElo(rs.getFloat("total_point"));
                    result.add(chessPlayer);
            }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
