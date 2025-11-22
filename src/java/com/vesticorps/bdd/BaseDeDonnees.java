package com.vesticorps.bdd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDeDonnees {
   
    private final String USERNAME = "root";
    private final String PASSWORD = "";
    private final String URL = "jdbc:mysql://127.0.0.1:3306/vesticorps?useUnicode=true&characterEncoding=utf8";
    
    public Connection getConnection()throws SQLException, ClassNotFoundException {
      Class.forName("com.mysql.jdbc.Driver");
      Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
      return connection;
    }     
}
