/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.io.Serializable;
import java.util.Date;
/**
 *
 * @author user
 */
public class ChessPlayer implements Serializable{
    private int id;
    private String name;
    private Date dob;
    private String national;
    private float elo;
//    private String result;
//    private float total_point;

    public ChessPlayer() {
        
    }

    public ChessPlayer(int id, String name, Date dob, String national, float elo) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.national = national;
        this.elo = elo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getNational() {
        return national;
    }

    public void setNational(String national) {
        this.national = national;
    }

    public float getElo() {
        return elo;
    }

    public void setElo(float elo) {
        this.elo = elo;
    }
    
}
