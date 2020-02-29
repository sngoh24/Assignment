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
public class Operating {

    public void process(TaxiDriver taxi) {
        switch (taxi.getStatus()) {
            case 0: { // find next Passenger
                if (!Variable.passLL.isEmpty()) {
                    nextPassenger(taxi);
                    taxi.getPassDoneLL().add(Variable.passLL.get(0));
                    Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                            Variable.taxi.getID(), "heading to " + taxi.getPassDoneLL().getLast().getName() + "'s source "
                            + taxi.getPassDoneLL().getLast().getSource()));
                    Variable.logBook.addAll(Variable.logBookLL.getLast());
                    taxi.setStatus(1);
                    taxi.setServiceHour(taxi.getServiceHour() + 1);
                } else {
                    //keep on looping

                }
                break;
            }
            case 1: { // taxi heading to source
                taxi.setServiceHour(taxi.getServiceHour() + 1);
                if (taxi.distance(taxi.getPassDoneLL().getLast().getSource()) > 0) {
                    leftRight(taxi, taxi.getPassDoneLL().getLast().getSource());

                } else {
//                    Variable.mapDisplay.jLabel[taxi.getX()][taxi.getY()].setText("");
                    taxi.setStatus(2);

                    taxi.getPassDoneLL().getLast().setInitialTime(Variable.currentTime);

                    Variable.passLL.getFirst().setFetch(true);

                    Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                            Variable.taxi.getID(), " fetching " + taxi.getPassDoneLL().getLast().getName() + " : "
                            + taxi.getPassDoneLL().getLast().getSource()));
                    Variable.logBook.addAll(Variable.logBookLL.getLast());

                    Variable.logBookLL.add(new LogBook(Variable.currentTime, taxi.getPassDoneLL().getLast().getName(),
                            taxi.getPassDoneLL().getLast().getID(), " is in " + Variable.taxi.getName() + "'s car"));
                    Variable.logBook.addAll(Variable.logBookLL.getLast());
                }
                break;
            }
            case 2: { // taxi heading to destination
                taxi.setServiceHour(taxi.getServiceHour() + 1);
                if (taxi.distance(taxi.getPassDoneLL().getLast().getDest()) > 0) {
                    leftRight(taxi, taxi.getPassDoneLL().getLast().getDest());
                } else {
                    taxi.setStatus(0);

                    taxi.getPassDoneLL().getLast().setFinalTime(Variable.currentTime);
                    Variable.passLL.removeFirst();

                    //Add Passenger in the passenger detail display
                    Variable.passDetail.dlm.addElement(taxi.getPassDoneLL().getLast().getID());
                    Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                            Variable.taxi.getID(), " dropped " + taxi.getPassDoneLL().getLast().getName() + " : "
                            + taxi.getPassDoneLL().getLast().getSource()));
                    Variable.logBook.addAll(Variable.logBookLL.getLast());

                    Variable.logBookLL.add(new LogBook(Variable.currentTime, taxi.getPassDoneLL().getLast().getName(),
                            taxi.getPassDoneLL().getLast().getID(), " left " + Variable.taxi.getName() + "'s car"));
                    Variable.logBook.addAll(Variable.logBookLL.getLast());
                }
                break;
            }
            default: {
                System.out.println("Status error");
            }

        }
    }

    public void nextPassenger(TaxiDriver taxi) {
        //get the clostest passenger
        int shortest = Variable.passLL.get(0).getSource().distance(taxi);
        int index = 0;
        for (int i = 1; i < Variable.passLL.size(); i++) {
            if (shortest > Variable.passLL.get(i).getSource().distance(taxi)) {
                shortest = Variable.passLL.get(i).getSource().distance(taxi);
                index = i;
            }
        }
        Variable.passLL.add(0, Variable.passLL.get(index));
        Variable.passLL.remove(index + 1);
    }

    public void upDown(TaxiDriver taxi, XYAxis pass) {
        if (taxi.diffX(pass.getX()) > 0) {
            //taxi moves to up
            taxi.setX(Variable.taxi.getX() - 1);
            taxi.setEndLocation(new XYAxis(taxi.getX(), taxi.getY()));

            Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                    Variable.taxi.getID(), " moved up"));
            Variable.logBook.addAll(Variable.logBookLL.getLast());

        } else if (taxi.diffX(pass.getX()) < 0) {
            //taxi moves to down
            taxi.setX(Variable.taxi.getX() + 1);
            taxi.setEndLocation(new XYAxis(taxi.getX(), taxi.getY()));

            Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                    Variable.taxi.getID(), " moved down"));
            Variable.logBook.addAll(Variable.logBookLL.getLast());

        } else {
        }
    }

    public void leftRight(TaxiDriver taxi, XYAxis pass) {
        if (taxi.diffY(pass.getY()) > 0) {
            //taxi moves to left
            taxi.setY(Variable.taxi.getY() - 1);
            taxi.setEndLocation(new XYAxis(taxi.getX(), taxi.getY()));

            Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                    Variable.taxi.getID(), " moved left"));
            Variable.logBook.addAll(Variable.logBookLL.getLast());

        } else if (taxi.diffY(pass.getY()) < 0) {
            //taxi moves to right
            taxi.setY(Variable.taxi.getY() + 1);
            taxi.setEndLocation(new XYAxis(taxi.getX(), taxi.getY()));

            Variable.logBookLL.add(new LogBook(Variable.currentTime, Variable.taxi.getName(),
                    Variable.taxi.getID(), " moved right"));
            Variable.logBook.addAll(Variable.logBookLL.getLast());

        } else {
            upDown(taxi, pass);
        }
    }

//public void process() {
//        availableDriver();
//
//    }
//    TaxiDriver driver;
//    LinkedList<XYAxis> xy = new LinkedList<XYAxis>();
//    int time = 0;
//    PrintWriter pw;
//
//    public Operating() throws FileNotFoundException {
//        driver = new TaxiDriver();
//        this.pw = new PrintWriter(new FileOutputStream("logfile.txt"));
//        pw.println("Execution Log:");
//        pw.println("");
//    }
//
//    public Operating(int x, int y) throws FileNotFoundException {
//        driver = new TaxiDriver(x, y);
//        this.pw = new PrintWriter(new FileOutputStream("logfile.txt"));
//        pw.println("Execution Log:");
//        pw.println("");
//    }
//
//    public void mission(LinkedList<Passenger> pass) {
//        for (int i = 0; i < pass.size(); i++) {
//            xy.add(new XYAxis(pass.get(i).getSourceX(),
//                    pass.get(i).getSourceY()));
//        }
//    }
//
//    public void insertionSort(TaxiDriver a, LinkedList<Passenger> pass) {
//        for (int i = 1; i < xy.size(); i++) {
//            for (int j = 0; j < i; j++) {
//                if (xy.get(j).distance(a.getX(), a.getY()) > xy.get(i).distance(a.getX(), a.getY())) {
//                    XYAxis temp = xy.get(j);
//                    xy.set(j, xy.get(i));
//                    xy.set(i, temp);
//
//                    Passenger temp1 = pass.get(j);
//                    pass.set(j, pass.get(i));
//                    pass.set(i, temp1);
//                }
//            }
//        }
//    }
//
//    public void process(LinkedList<Passenger> pass) {
//        if (time == 0) {
//            pw.print("[" + time + "]\tTaxi started.");
//            System.out.println("[" + time + "]\tTaxi started.");
//            pw.println(" " + driver);
//        }
//        if (xy.isEmpty()) {
//            pw.println("[" + time + "]\tTaxi Ended");
//            System.out.println("[" + time + "]\tTaxi Ended.");
//            pw.close();
////            System.out.println("End");
//        } else {
//            if (!pass.get(0).getReach()) {
//                insertionSort(driver, pass);
//            }
////            time += (xy.get(0).diffX(driver) + xy.get(0).diffY(driver));
//            for (int i = 0; Math.abs(xy.get(0).diffY(driver.getY())) > 0
//                    && i < Math.abs(xy.get(0).diffY(driver.getY())) + 1; i++) {
//                time++;
//                int a = 0;
//                if (xy.get(0).diffY(driver.getY()) < 0) {
//                    a = driver.getY() - 1;
//                    pw.print("[" + time + "]\tTaxi move left");
////                    System.out.println("left");
//                } else if (xy.get(0).diffY(driver.getY()) > 0) {
//                    pw.print("[" + time + "]\tTaxi move right");
//                    a = driver.getY() + 1;
////                    System.out.println("right");
//                }
//                driver.setY(a);
//                pw.println(" " + driver);
//            }
//            for (int i = 0; Math.abs(xy.get(0).diffX(driver.getX())) > 0
//                    && i < Math.abs(xy.get(0).diffX(driver.getX())) + 1; i++) {
//                time++;
//                int a = 0;
//                if (xy.get(0).diffX(driver.getX()) < 0) {
//                    pw.print("[" + time + "]\tTaxi move up");
//                    a = driver.getX() - 1;
////                    System.out.println("up");
//                } else if (xy.get(0).diffX(driver.getX()) > 0) {
//                    pw.print("[" + time + "]\tTaxi move down");
//                    a = driver.getX() + 1;
////                    System.out.println("down");
//                }
//
//                driver.setX(a);
//                pw.println(" " + driver);
//            }
////            System.out.print("Driver reach " + pass.get(0).getLabel());
////            System.out.println(": " + driver.getX() + ", " + driver.getY());
//            if (!pass.get(0).getReach()) {
//                pass.get(0).setInitialTime(time);
//                pw.print("[" + time + "]\tTaxi fetch Passenger " + pass.get(0).getLabel());
//                pw.println(" " + driver);
//                xy.set(0, new XYAxis(pass.get(0).getDestX(),
//                        pass.get(0).getDestY()));
//                pass.get(0).setReach(true);
////                System.out.println("fetched: " + pass.get(0).getLabel());
//            } else {
//                pass.get(0).setFinalTime(time);
//                pw.print("[" + time + "]\tTaxi drop Passenger " + pass.get(0).getLabel());
//                pw.println(" " + driver);
////                System.out.println("removed: " + pass.get(0).getLabel());
////                System.out.println("Initial: " + pass.get(0).getInitialTime());
////                System.out.println("Final: " + pass.get(0).getFinalTime());
////                System.out.println("waiting time: " + pass.get(0).getWaitTime());
//                xy.remove(0);
//                pass.remove(0);
//            }
////            (new Map()).printMap(pass);
//            process(pass);
//        }
//    }
}
