/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Database;

/**
 *
 * @author Asus
 */
public interface DatabaseInformation {

    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String serverName = "localhost";
    public static String portNumber = "1433";
    public static String userName = "sa";
    public static String password = "16100508";
    public static String dbName = "CafenaCoffeeShop";
    public static String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;

}
