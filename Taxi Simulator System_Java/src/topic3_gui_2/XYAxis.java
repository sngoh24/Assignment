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
public class XYAxis {

    protected int x = 0;
    protected int y = 0;

    public XYAxis() {

    }

    public XYAxis(int x, int y) {
        this.x = x;
        this.y = y;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getX() {
        return x;
    }

    public void setY(int y) {
        this.y = y;
    }

    public int getY() {
        return y;
    }

    public int distance(XYAxis a) {
        int dist = Math.abs(diffX(a.getX())) + Math.abs(diffY(a.getY()));
        return dist;
    }

    public int diffX(int x1) {
        int dist = getX() - x1;
        return dist;
    }

    public int diffY(int y1) {
        int dist = getY() - y1;
        return dist;
    }

    public String toString() {
        return "(" + x + ", " + y + ")";
    }

}
