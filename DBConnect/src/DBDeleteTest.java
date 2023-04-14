import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBDeleteTest {
    private final static String URL = "jdbc:mariadb://localhost:3306/mydatabase";
    private final static String USER = "root";
    private final static String PASSWORD = "playdata";

    public static void main(String[] args) {
        try(Connection cnn = DriverManager.getConnection(URL, USER, PASSWORD)){
            System.out.println("DB 연결 성공");
            String sql = "Delete from employees where emp_no = ?";
            try(PreparedStatement ps = cnn.prepareStatement(sql)){
                ps.setInt(1, 10006);
                int row = ps.executeUpdate();
                System.out.println(row+"줄 제거");
            } catch (SQLException e){
                System.out.println("줄 삭제 실패");
            }
        }catch (SQLException e){
            System.out.println("DB 연결 실패");
        }
    }
}
