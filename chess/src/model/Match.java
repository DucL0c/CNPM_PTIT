/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.ArrayList;
/**
 *
 * @author user
 */
public class Match implements Serializable{
    private int id;
    private String nameMatch;
    private ArrayList<Chess_Match> chess_Match;

    public Match() {
    }

    public Match(int id, String nameMatch, ArrayList<Chess_Match> chess_Match) {
        this.id = id;
        this.nameMatch = nameMatch;
        this.chess_Match = chess_Match;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameMatch() {
        return nameMatch;
    }

    public void setNameMatch(String nameMatch) {
        this.nameMatch = nameMatch;
    }

    public ArrayList<Chess_Match> getChess_Match() {
        return chess_Match;
    }

    public void setChess_Match(ArrayList<Chess_Match> chess_Match) {
        this.chess_Match = chess_Match;
    }
    
}
