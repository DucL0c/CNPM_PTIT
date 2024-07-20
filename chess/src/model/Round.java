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
public class Round implements Serializable{
    private int id;
    private String nameRound;
    private Date dateTime;
    private int numberOfMatch;

    public Round() {
    }

    public Round(int id, String nameRound, Date dateTime, int numberOfMatch) {
        this.id = id;
        this.nameRound = nameRound;
        this.dateTime = dateTime;
        this.numberOfMatch = numberOfMatch;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameRound() {
        return nameRound;
    }

    public void setNameRound(String nameRound) {
        this.nameRound = nameRound;
    }

    public Date getDateTime() {
        return dateTime;
    }

    public void setDateTime(Date dateTime) {
        this.dateTime = dateTime;
    }

    public int getNumberOfMatch() {
        return numberOfMatch;
    }

    public void setNumberOfMatch(int numberOfMatch) {
        this.numberOfMatch = numberOfMatch;
    }

    
}
