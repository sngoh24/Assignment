/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package topic3_gui_2;

/**
 *
 * @author Sin Ni
 */
public class LogBook {

    private int time;
    private String name;
    private String ID;
    private String action;

    public LogBook(int time, String name, String ID, String action) {
        this.time = time;
        this.name = name;
        this.ID = ID;
        this.action = action;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int i) {
        this.time = i;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
