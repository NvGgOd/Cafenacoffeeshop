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
public class Drink {

    private int drinkID;
    private String drinkName;
    private float price;
    private String kind;
    private String image;
    private String description;
    private int orderTime;

    public Drink() {
    }

    public Drink(int drinkID, String drinkName, float price, String kind, String image, String description, int orderTime) {
        this.drinkID = drinkID;
        this.drinkName = drinkName;
        this.price = price;
        this.kind = kind;
        this.image = image;
        this.description = description;
        this.orderTime = orderTime;
    }

    public int getDrinkID() {
        return drinkID;
    }

    public void setDrinkID(int drinkID) {
        this.drinkID = drinkID;
    }

    public String getDrinkName() {
        return drinkName;
    }

    public void setDrinkName(String drinkName) {
        this.drinkName = drinkName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(int orderTime) {
        this.orderTime = orderTime;
    }

    @Override
    public String toString() {
        return "Drink{" + "drinkID=" + drinkID + ", drinkName=" + drinkName + ", price=" + price + ", kind=" + kind + ", image=" + image + ", description=" + description + ", orderTime=" + orderTime + '}';
    }

}
