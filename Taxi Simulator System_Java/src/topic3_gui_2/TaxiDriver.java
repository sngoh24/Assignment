/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package topic3_gui_2;

import java.util.LinkedList;

/**
 *
 * @author Sin Ni
 */
public class TaxiDriver extends XYAxis {

    private String name;
    private String taxiID = "D001";
    private XYAxis startLocation;
    private XYAxis endLocation;
    private static int status = 0;
    private LinkedList<Passenger> passDoneLL = new LinkedList();
    private int serviceHour = -1;
    private int iTime = 0;

    public TaxiDriver() {
        this.name = "Name";
        this.taxiID = "ID";
        startLocation = new XYAxis(0, 0);
        endLocation = new XYAxis(0, 0);
    }

    public TaxiDriver(String name, String taxiID) {
        this.name = name;
        this.taxiID = taxiID;
        x = 0;
        y = 0;
        startLocation = new XYAxis(x, y);
        endLocation = new XYAxis(x, y);
    }

    public TaxiDriver(String name, String taxiID, int x, int y) {
        this.name = name;
        this.taxiID = taxiID;
        this.x = x;
        this.y = y;
        startLocation = new XYAxis(x, y);
        endLocation = new XYAxis(x, y);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getID() {
        return taxiID;
    }

    public void setID(String ID) {
        this.taxiID = ID;
    }

    public XYAxis getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(XYAxis startLocation) {
        this.startLocation = startLocation;
    }

    public XYAxis getEndLocation() {
        return endLocation;
    }

    public void setEndLocation(XYAxis endLocation) {
        this.endLocation.setX(endLocation.getX());
        this.endLocation.setY(endLocation.getY());
    }

    public int getInitialTime() {
        return iTime;
    }

    public void setInitialTime(int iTime) {
        this.iTime = iTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int i) {
        this.status = i;
    }

    public int getServiceHour() {
        return serviceHour;
    }

    public void setServiceHour(int hour) {
        this.serviceHour = hour;
    }

    public LinkedList<Passenger> getPassDoneLL() {
        return passDoneLL;
    }

    @Override
    public String toString() {
        return "Driver name: " + this.name + "\nDriver ID: " + this.taxiID
                + "\nCurrent Location: (" + x + ", " + y + ")";

    }

}
