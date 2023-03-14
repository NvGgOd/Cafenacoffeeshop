/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Model;

import Database.DatabaseConnection;
import Entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Asus
 */
public class AccountModel {

    public static Account getAccountByAccess(String email, String password, String access) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            String sql = "SELECT * FROM Account WHERE Email = ? AND Password = ? AND Access = ?;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, access);
            result = statement.executeQuery();
            while (result.next()) {
                return new Account(result.getString(1), result.getString(2), result.getString(3), result.getString(4), result.getString(5), result.getString(6), result.getString(7));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return null;
    }

    public static Account getAccountByEmail(String email) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            String sql = "SELECT * FROM Account WHERE Email = ?;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, email);
            result = statement.executeQuery();
            while (result.next()) {
                return new Account(result.getString(1), result.getString(2), result.getString(3), result.getString(4), result.getString(5), result.getString(6), result.getString(7));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return null;
    }

}
