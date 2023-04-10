import java.sql.*;
public class TryCatchFinallyExample {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/mydatabase";
            String user = "root";
            String password = "playdata";
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to MariaDB!");
        } catch (SQLException e) {
            System.err.println("Failed to connect to MariaDB: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            System.err.println("Could not find the MariaDB JDBC driver class: " + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                System.err.println("Failed to close connection: " + e.getMessage());
            }
        }
    }
}