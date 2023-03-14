/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Asus
 */
public class DatabaseConnection implements DatabaseInformation {

    private static DatabaseConnection instance;

    public Connection getConnection() {
        try {
            Class.forName(driverName);
            Connection connection = DriverManager.getConnection(url, userName, password);
            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static DatabaseConnection getInstance() {
        if (instance == null) {
            instance = new DatabaseConnection();
        }
        return instance;
    }

    public void close(Connection connection, PreparedStatement statement, ResultSet result) throws SQLException {
        if (result != null && !result.isClosed()) {
            result.close();
        }
        if (statement != null && !statement.isClosed()) {
            statement.close();
        }
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

}
