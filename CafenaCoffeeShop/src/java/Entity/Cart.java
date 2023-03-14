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
public class Cart {

    private int cartID;
    private String email;
    private int drinkID;
    private int amount;
    private boolean checkOut;
    private String dateCheckOut;

    public Cart() {
    }

    public Cart(int cartID, String email, int drinkID, int amount, boolean checkOut) {
        this.cartID = cartID;
        this.email = email;
        this.drinkID = drinkID;
        this.amount = amount;
        this.checkOut = checkOut;
    }

    public Cart(int cartID, String email, int drinkID, int amount, boolean checkOut, String dateCheckOut) {
        this.cartID = cartID;
        this.email = email;
        this.drinkID = drinkID;
        this.amount = amount;
        this.checkOut = checkOut;
        this.dateCheckOut = dateCheckOut;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDrinkID() {
        return drinkID;
    }

    public void setDrinkID(int drinkID) {
        this.drinkID = drinkID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public boolean isCheckOut() {
        return checkOut;
    }

    public void setCheckOut(boolean checkOut) {
        this.checkOut = checkOut;
    }

    public String getDateCheckOut() {
        return dateCheckOut;
    }

    public void setDateCheckOut(String dateCheckOut) {
        this.dateCheckOut = dateCheckOut;
    }

    @Override
    public String toString() {
        return "Cart{" + "cartID=" + cartID + ", email=" + email + ", drinkID=" + drinkID + ", amount=" + amount + ", checkOut=" + checkOut + ", dateCheckOut=" + dateCheckOut + '}';
    }

}
