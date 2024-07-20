/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author user
 */
public class Chess_Match implements Serializable{
    private int id;
    private String result;
    //private float pointGain;
    private float eloChange;
    private ChessPlayer chessPlayer;
    //private String Opponent_name;
    //private int TblMatchId;

    public Chess_Match() {
    }

    public Chess_Match(int id, String result, float eloChange, ChessPlayer chessPlayer) {
        this.id = id;
        this.result = result;
        this.eloChange = eloChange;
        this.chessPlayer = chessPlayer;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public float getEloChange() {
        return eloChange;
    }

    public void setEloChange(float eloChange) {
        this.eloChange = eloChange;
    }

    public ChessPlayer getChessPlayer() {
        if(chessPlayer==null){
            chessPlayer = new ChessPlayer();
        }
        return chessPlayer;
    }

    public void setChessPlayer(ChessPlayer chessPlayer) {
        this.chessPlayer = chessPlayer;
    }
    
    
    
}
