/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Model;

import Database.DatabaseConnection;
import Entity.Drink;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Asus
 */
public class DrinkModel {

    public static ArrayList<Drink> getDrinks() throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        ArrayList<Drink> drinks = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Drink ORDER BY DrinkName;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            result = statement.executeQuery();
            while (result.next()) {
                drinks.add(new Drink(result.getInt(1), result.getString(2), result.getFloat(3), result.getString(4), result.getString(5), result.getString(6), result.getInt(7)));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return drinks;
    }

    public static Drink getDrinkByID(int drinkID) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            String sql = "SELECT * FROM Drink WHERE DrinkID = ?;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, drinkID);
            result = statement.executeQuery();
            while (result.next()) {
                return new Drink(result.getInt(1), result.getString(2), result.getFloat(3), result.getString(4), result.getString(5), result.getString(6), result.getInt(7));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return null;
    }

    public static ArrayList<Drink> getBestSeller() throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        ArrayList<Drink> drinks = new ArrayList<>();
        try {
            String sql = "SELECT TOP 3 * FROM Drink ORDER BY OrderTime;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            result = statement.executeQuery();
            while (result.next()) {
                drinks.add(new Drink(result.getInt(1), result.getString(2), result.getFloat(3), result.getString(4), result.getString(5), result.getString(6), result.getInt(7)));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return drinks;
    }

    public static ArrayList<Drink> searchDrink(String key) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        ArrayList<Drink> drinks = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Drink WHERE DrinkName LIKE '%" + key + "%' OR Kind LIKE '%" + key + "%' ORDER BY DrinkName;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            result = statement.executeQuery();
            while (result.next()) {
                drinks.add(new Drink(result.getInt(1), result.getString(2), result.getFloat(3), result.getString(4), result.getString(5), result.getString(6), result.getInt(7)));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return drinks;
    }

}
