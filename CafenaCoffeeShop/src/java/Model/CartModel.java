/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Model;

import Database.DatabaseConnection;
import Entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Asus
 */
public class CartModel {

    public static ArrayList<Cart> getCartsByEmail(String email) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        ArrayList<Cart> carts = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Cart WHERE Email = ? AND CheckOut = 0";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            result = statement.executeQuery();
            while (result.next()) {
                carts.add(new Cart(result.getInt(1), result.getString(2), result.getInt(3), result.getInt(4), result.getBoolean(5)));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return carts;
    }

    public static void addCartByEmail(String email, int drinkID, int amount) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            String sql = "INSERT INTO Cart(Email, DrinkID, Amount, CheckOut) VALUES (?, ?, ?, 0);";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setInt(2, drinkID);
            statement.setInt(3, amount);
            result = statement.executeQuery();
        } catch (SQLException ex) {
        } finally {
            database.close(connection, statement, result);
        }
    }

    public static void updateCartByEmail(String email, int drinkID, int amount) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            String sql = "UPDATE Cart SET Amount = ? WHERE Email = ? AND DrinkID = ? AND CheckOut = 0;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, amount);
            statement.setString(2, email);
            statement.setInt(3, drinkID);
            result = statement.executeQuery();
        } catch (SQLException ex) {
        } finally {
            database.close(connection, statement, result);
        }
    }

    public static int getSumPriceByEmail(String email) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            String sql = "SELECT SUM(Price * Amount) FROM Cart, Drink WHERE Email = ? AND Cart.DrinkID = Drink.DrinkID AND CheckOut = 0;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            result = statement.executeQuery();
            while (result.next()) {
                return result.getInt(1);
            }
        } catch (SQLException ex) {
        } finally {
            database.close(connection, statement, result);
        }
        return 0;
    }

}
