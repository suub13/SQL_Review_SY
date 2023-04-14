import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBUpdateTest {
    private final static String URL= "jdbc:mariadb://localhost:3306/mydatabase";
    private final static String USER = "root";
    private final static String PASSWORD = "playdata";

    public static void main(String[] args) {
        try(Connection cnn = DriverManager.getConnection(URL, USER, PASSWORD)){
            String sql = "UPDATE employees set first_name = ? where emp_no = ?";
            try(PreparedStatement ps = cnn.prepareStatement(sql)){
                ps.setString(1, "Jane");
                ps.setInt(2, 10006);
                int row = ps.executeUpdate();
                System.out.println(row+"개의 데이터가 updated");
            } catch (SQLException e){
                System.out.println("데이터 업데이트 실패");
            }
        } catch (SQLException e){
            System.out.println("DB 연결 실패");
        }
    }
}
