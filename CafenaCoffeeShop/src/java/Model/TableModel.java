/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Model;

import Database.DatabaseConnection;
import Entity.Table;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Asus
 */
public class TableModel {

    public static ArrayList<Table> getTablesByDateTime(String date, String time) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        ArrayList<Table> tables = new ArrayList<>();
        try {
            String sql = "SELECT a.TableID, TableName, Price, People, COALESCE(b.Status, 0) AS Status "
                    + "FROM Tables AS a LEFT JOIN "
                    + "(SELECT Tables.TableID, COUNT(Tables.TableID) AS Status "
                    + "FROM Tables INNER JOIN TableBooking "
                    + "ON Tables.TableID = TableBooking.TableID AND Date = '" + date + "' AND Time = ? "
                    + "GROUP BY Tables.TableID) AS b "
                    + "ON a.TableID = b.TableID ORDER BY TableName;";
            connection = database.getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(time));
            result = statement.executeQuery();
            while (result.next()) {
                tables.add(new Table(result.getInt(1), result.getString(2), result.getFloat(3), result.getInt(4), result.getInt(5)));
            }
        } catch (SQLException ex) {
            return null;
        } finally {
            database.close(connection, statement, result);
        }
        return tables;
    }

    public static void BookingTable(String email, String date, String time, String[] tableIDs) throws SQLException {
        DatabaseConnection database = new DatabaseConnection();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet result = null;
        try {
            connection = database.getConnection();
            for (int i = 0; i < tableIDs.length; i++) {
                String sql = "INSERT INTO TableBooking VALUES (?, ?, '" + date + "', ?)";
                statement = connection.prepareStatement(sql);
                statement.setString(1, email);
                statement.setInt(2, Integer.parseInt(tableIDs[i]));
                statement.setInt(3, Integer.parseInt(time));
                result = statement.executeQuery();
            }
        } catch (SQLException ex) {
        } finally {
            database.close(connection, statement, result);
        }
    }

}
