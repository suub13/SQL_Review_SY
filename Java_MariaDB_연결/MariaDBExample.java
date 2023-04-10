import java.sql.*;

public class MariaDBExample {
    private static final String URL = "jdbc:mariadb://localhost:3306/mydatabase";
    private static final String USER = "root";
    private static final String PASSWORD = "playdata";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL,USER, PASSWORD)){
            System.out.println("DB 연결 성공");

            select(conn);
            insert(conn);
            select(conn);
            update(conn);
            select(conn);
            delete(conn);
            select(conn);

        } catch (SQLException e){
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }

    }
    private static void select(Connection conn) {
        String sql = "select * from mytable";
        try(PreparedStatement stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery()){
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                System.out.print("id = "+id);
                System.out.println(", name = "+name);
            }
        } catch (SQLException e){
            System.out.println("조회 실패");
            e.printStackTrace();
        }
    }
    private static void insert(Connection conn) {
        String sql = "insert into mytable (id, name) values (?,?)";
        try(PreparedStatement stat = conn.prepareStatement(sql)){
            stat.setInt(1,6);
            stat.setString(2,"John");
            int row = stat.executeUpdate();
            System.out.println(row+"개의 레코드가 추가되었습니다.");
        } catch (SQLException e){
            System.out.println("INSERT QUERY 수행 실패");
            e.printStackTrace();
        }
    }
    private static void update(Connection conn) {
        String sql = "UPDATE mytable set name = ? WHERE id = ?";
        try(PreparedStatement stat = conn.prepareStatement(sql)){
            stat.setString(1,"Jane");
            stat.setInt(2,1);
            int row = stat.executeUpdate();
            System.out.println(row+"개의 레코드가 업데이트 되었습니다.");
        } catch (SQLException e){
            System.out.println("DELETE QUERY 실패");
            e.printStackTrace();
        }
    }
    private static void delete(Connection conn) {
        String sql = "DELETE FROM mytable WHERE id = ?";
        try(PreparedStatement stat = conn.prepareStatement(sql)){
            stat.setInt(1,1);
            int row = stat.executeUpdate();
            System.out.println(row +"개의 record가 삭제되었습니다.");
        }catch (SQLException e){
            System.out.println("DELETE 쿼리 실행 실패");
            e.printStackTrace();
        }
    }

}
