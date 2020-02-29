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
public class Passenger {

    private String name;
    private String passID;
    private static int passNo = 0;
    private XYAxis source;
    private XYAxis dest;
    private int maxWaitingTime;
    private boolean cancel = false;
    private boolean fetching = false;
    private int requestTime = Variable.currentTime;
    private int iTime = 0;
    private int fTime = 0;
    private TaxiDriver driver;

    public Passenger(String name) {
        this.name = name;
        passNo++;
        if (passNo < 10) {
            this.passID = "P00" + passNo;
        } else if (passNo < 100) {
            this.passID = "P0" + passNo;
        } else {
            this.passID = "P" + passNo;
        }
    }

    public Passenger(String name, XYAxis source, XYAxis dest) {
        this.name = name;
        this.source = source;
        this.dest = dest;
        passNo++;
        if (passNo < 10) {
            this.passID = "P00" + passNo;
        } else if (passNo < 100) {
            this.passID = "P0" + passNo;
        } else {
            this.passID = "P" + passNo;
        }
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getID() {
        return passID;
    }

    public void setID(String ID) {
        this.passID = ID;
    }

    public XYAxis getSource() {
        return source;
    }

    public void setSource(XYAxis source) {
        this.source = source;
    }

    public XYAxis getDest() {
        return dest;
    }

    public void setDest(XYAxis dest) {
        this.dest = dest;
    }

    public int getSourceX() {
        return source.getX();
    }

    public void setSourceX(int source_x) {
        source.setX(source_x);
    }

    public int getSourceY() {
        return source.getY();
    }

    public void setSourceY(int source_y) {
        source.setY(source_y);
    }

    public int getDestX() {
        return dest.getX();
    }

    public void setDestX(int dest_x) {
        dest.setX(dest_x);
    }

    public int getDestY() {
        return dest.getY();
    }

    public void setDestY(int dest_y) {
        dest.setY(dest_y);
    }

    public void setCancel(boolean a) {
        this.cancel = a;
    }

    public boolean getCancel() {
        return cancel;
    }

    public int getMaxWaitTime() {
        return maxWaitingTime;
    }

    public void setMaxWaitTime(int time) {
        this.maxWaitingTime = time;
    }

    public int getPassengerNo() {
        return passNo;
    }

    public void setPassengerNo(int passNo) {
        this.passNo = passNo;
    }

    public TaxiDriver getDriver() {
        return driver;
    }

    public void setDriver(TaxiDriver driver) {
        this.driver = driver;
    }

    public void setFetch(boolean a) {
        fetching = a;
    }

    public boolean getFetch() {
        return fetching;
    }

    public void setInitialTime(int iTime) {
        this.iTime = iTime;
    }

    public int getInitialTime() {
        return iTime;
    }

    public void setFinalTime(int fTime) {
        this.fTime = fTime;
    }

    public int getFinalTime() {
        return fTime;
    }

    public void setRequestTime(int requestTime) {
        this.requestTime = requestTime;
    }

    public int getRequestTime() {
        return requestTime;
    }

    public int getWaitTime() {
        return iTime - requestTime;
    }

    public int getRideTime() {
        return fTime - iTime;
    }

    public String toString() {
        return "Passenger: " + name + "\nPassenger No: " + getID()
                + "\nSource: " + source + "\nDestination: " + dest;
                
    }
//    public static void main(String []arg){
//        TaxiDriver taxi = new TaxiDriver("T");
//        Passenger pass = new Passenger("A");
//        pass.setDriver(taxi);
//        System.out.println(pass.toString());
//        System.out.println("?");
//        System.exit(0);
//    }

}
