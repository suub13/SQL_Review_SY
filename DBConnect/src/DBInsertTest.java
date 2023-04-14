import org.mariadb.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBInsertTest {
    private final static String URL = "jdbc:mariadb://localhost:3306/mydatabase";
    private static final String USER = "root";
    private static final String PASSWORD = "playdata";
    public static void main(String[] args) {
        try(Connection cnn = DriverManager.getConnection(URL, USER, PASSWORD)){
            System.out.println("DB 연결 성공");
            String sql = "INSERT INTO employees (emp_no, birth_date, first_name, last_name, gender, hire_date) " +
                    "values (?, ? , ? , ? ,?, ?)";
            try(PreparedStatement ps = cnn.prepareStatement(sql)){
                ps.setInt(1, 10006);
                ps.setString(2, "1965-08-08");
                ps.setString(3, "John");
                ps.setString(4, "Doe");
                ps.setString(5, "M");
                ps.setString(6, "1990-01-01");
                int row = ps.executeUpdate();
                System.out.println(row+"개의 데이터가 insert 되었습니다.");
            } catch (SQLException e){
                System.out.println("데이터 입력 실패");
            }
        } catch(SQLException e){
            System.out.println("DB 연결 실패");
        }
    }
}
