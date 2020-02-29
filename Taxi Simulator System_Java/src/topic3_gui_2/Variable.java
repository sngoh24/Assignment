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
public class Variable {

    public static LinkedList<Passenger> passLL = new LinkedList();
    public static int currentTime = 0;
    public static XYAxis mapSize = new XYAxis(10, 10);

    public static MapDisplay mapDisplay = new MapDisplay();
    
    public static Operating operate = new Operating ();

    public static TaxiDriver taxi = new TaxiDriver();
    public static EditTaxi addTaxi = new EditTaxi();
    public static TaxiDetail taxiDetail = new TaxiDetail();

    public static AddPassenger addPass = new AddPassenger();
    public static PassengerDetail passDetail = new PassengerDetail();
    public static PassengerReport passReport = new PassengerReport();

    public static LinkedList<LogBook> logBookLL = new LinkedList();
    public static LogBookDisplay logBook = new LogBookDisplay();

}
