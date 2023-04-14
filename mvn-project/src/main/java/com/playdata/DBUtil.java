package com.playdata;

import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    public static Connection getConnection(ServletContext context) throws SQLException, ClassNotFoundException {
        String url = context.getInitParameter("DB_URL");
        String user = context.getInitParameter("DB_USER");
        String password = context.getInitParameter("DB_PASSWORD");
        
        Class.forName("org.mariadb.jdbc.Driver"); // Java 7부터 생략 가능
        return DriverManager.getConnection(url, user, password);
    }
}
