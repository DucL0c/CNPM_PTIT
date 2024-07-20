/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import model.Chess_Match;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Match;
import model.ChessPlayer;

/**
 *
 * @author user
 */
public class HistoryDAO extends DAO {

    public HistoryDAO() {
        super();
    }

    public ArrayList<Chess_Match> getHistory(int idChessPlayer) {
        ArrayList<Chess_Match> result = new ArrayList<>();
        String sql  =   "WITH MatchDetails AS (\n" +
                        "    SELECT \n" +
                        "        r.id AS RoundID,\n" +
                        "        cp1.id AS PlayerID,\n" +
                        "        cp1.name AS PlayerName,\n" +
                        "        cp1.elo AS PlayerElo,\n" +
                        "        cp2.name AS OpponentName,\n" +
                        "        cp2.elo AS OpponentElo,\n" +
                        "        cm.pointGain\n" +
                        "    FROM \n" +
                        "        tblChess_Match cm\n" +
                        "    JOIN \n" +
                        "        tblMatch tm ON cm.tblMatchId = tm.id\n" +
                        "    JOIN \n" +
                        "        tblRound r ON tm.tblRoundId = r.id\n" +
                        "    JOIN \n" +
                        "        tblChess_Match opp ON opp.tblMatchId = tm.id AND opp.id != cm.id\n" +
                        "    JOIN \n" +
                        "        tblChessPlayer cp1 ON cm.tblChessPlayerid = cp1.id\n" +
                        "    JOIN \n" +
                        "        tblChessPlayer cp2 ON opp.tblChessPlayerid = cp2.id\n" +
                        "    WHERE \n" +
                        "        cm.tblChessPlayerid = ?\n" +
                        "),\n" +
                        "EloCalculations AS (\n" +
                        "    SELECT \n" +
                        "        RoundID,\n" +
                        "        PlayerID,\n" +
                        "        PlayerName,\n" +
                        "        PlayerElo,\n" +
                        "        OpponentName,\n" +
                        "        OpponentElo,\n" +
                        "        pointGain,\n" +
                        "        1.0 / (1.0 + POWER(10.0, (OpponentElo - PlayerElo) / 400.0)) AS ExpectedScore,\n" +
                        "        CASE \n" +
                        "            WHEN pointGain = 1 THEN 20\n" +
                        "            WHEN pointGain = 0 THEN -20\n" +
                        "            WHEN pointGain = 0.5 THEN 0\n" +
                        "        END AS StaticEloChange,\n" +
                        "        20 * (pointGain - (1.0 / (1.0 + POWER(10.0, (OpponentElo - PlayerElo) / 400.0)))) AS EloChange\n" +
                        "    FROM \n" +
                        "        MatchDetails\n" +
                        ")\n" +
                        "SELECT \n" +
                        "    RoundID,\n" +
                        "    --PlayerName,\n" +
                        "    --PlayerElo,\n" +
                        "    OpponentName,\n" +
                        "    --OpponentElo,\n" +
                        "    --pointGain,\n" +
                        "    --ExpectedScore,\n" +
                        "    EloChange,\n" +
                        "	CASE \n" +
                        "        WHEN pointGain = 1 THEN 'W'\n" +
                        "        WHEN pointGain = 0 THEN 'L'\n" +
                        "        WHEN pointGain = 0.5 THEN 'H'\n" +
                        "    END AS result\n" +
                        "FROM \n" +
                        "    EloCalculations\n" +
                        "ORDER BY \n" +
                        "    RoundID;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idChessPlayer);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Chess_Match chessMatch = new Chess_Match();
                //chessMatch.setResult(rs.getString("result"));
                //chessMatch.setTblMatchId(rs.getInt("RoundID"));
                chessMatch.getChessPlayer().setName(rs.getString("OpponentName"));
                chessMatch.setResult(rs.getString("result"));
                chessMatch.setEloChange(rs.getFloat("EloChange"));
                result.add(chessMatch);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
