package database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 커넥션을 얻어오는 클래스 - JNDI
public class DBConnection {
    static final String USERNAME = "root";
    static final String PASSWORD = "0829";
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/gomyammi";

    public static Connection getConnection() throws SQLException, NamingException, ClassNotFoundException {
        Connection conn = null;
        Statement stmt = null;
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        System.out.println("\n- MySQL Connection");
        stmt = conn.createStatement();
        return conn;
    }
}