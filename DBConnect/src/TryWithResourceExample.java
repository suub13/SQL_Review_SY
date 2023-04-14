import java.sql.*;
public class TryWithResourceExample {
    public static void main(String[] args) {
// MariaDB 연결 정보 설정
        String url = "jdbc:mariadb://localhost:3306/mydatabase";
        String user = "root";
        String password = "playdata";
// MariaDB 연결
        try (Connection conn = DriverManager.getConnection(url, user, password)) {
// 연결 성공
            System.out.println("Connected to MariaDB!");
        } catch (SQLException e) {
// 연결 실패
            System.err.println("Failed to connect to MariaDB: " + e.getMessage());
        }
    }
}