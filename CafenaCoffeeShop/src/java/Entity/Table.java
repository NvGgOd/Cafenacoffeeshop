/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Asus
 */
public class Table {

    private int tableID;
    private String tableName;
    private float price;
    private int people;
    private int status;

    public Table() {
    }

    public Table(int tableID, String tableName, float price, int people, int status) {
        this.tableID = tableID;
        this.tableName = tableName;
        this.price = price;
        this.people = people;
        this.status = status;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getPeople() {
        return people;
    }

    public void setPeople(int people) {
        this.people = people;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Table{" + "tableID=" + tableID + ", tableName=" + tableName + ", price=" + price + ", people=" + people + ", status=" + status + '}';
    }

}
