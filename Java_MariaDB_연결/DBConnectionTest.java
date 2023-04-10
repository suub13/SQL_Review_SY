import java.sql.*;

public class DBConnectionTest {
    private static final String URL = "jdbc:mariadb://localhost:3306/mydatabase";
    private static final String USER = "root";
    private static final String PASSWORD = "playdata";

    public static void main(String[] args) {
        try (Connection cnn = DriverManager.getConnection(URL, USER, PASSWORD)){
            System.out.println("DB 연결 성공");
            DBSelectTest(cnn);
        } catch (SQLException e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
        
    }

    private static void DBSelectTest(Connection cnn) {
        String sql = "select first_name, last_name, hire_date from employees";
        try(PreparedStatement ps = cnn.prepareStatement(sql)){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String hire_date = rs.getString("hire_date");
                System.out.println("name: "+first_name+" "+last_name + "\t\thired from "+hire_date);
            }
        } catch (SQLException e) {
            System.out.println("데이터 불러오기 실패");
            e.printStackTrace();
        }
    }
}
