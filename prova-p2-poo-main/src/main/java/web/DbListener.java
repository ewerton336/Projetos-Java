package web;

import db.User;


import java.sql.*;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

public class DbListener implements ServletContextListener {
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:siga-copy.db";
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try{
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute(User.getCreateStatement());
            if(User.getUsers().isEmpty()){
                User.insertUser("admin", "Administrador", "ADMIN", "1234");
                User.insertUser("ewerton", "Ewerton Guimaraes", "USER", "1234");
            }
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }


    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
