package com.playdata;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;
import java.sql.SQLException;

public class DBServletContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        try {
            // DB connection 객체 생성
            Connection cnn = DBUtil.getConnection(context);

            // DB connection 객체를 ServletContext에 저장
            context.setAttribute("dbConnection", cnn);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        // servletcontext에 저장된 DB connection 객체를 가져온다.
        Connection cnn = (Connection) context.getAttribute("dbConnection");
        try{
            // DB Connection 격체를 닫는다.
            cnn.close();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
