package database;

import java.sql.*;

public class Dao {

    static final private String USERNAME = "root";
    static final private String PASSWORD = "0829";
    static final private String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final private String DB_URL = "jdbc:mysql://127.0.0.1:3306/gomyammi";
    Connection conn = null;
    Statement stmt = null;

    public Dao() throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        System.out.println("\n- MySQL Connection");
        stmt = conn.createStatement();
        System.out.println("\n\n- MySQL Connection Close");
    }

    public void showAllUser() throws SQLException {

        String sql;
        sql = "SELECT username, password , email FROM user";
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String username = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            System.out.print("\n** username : " + username);
            System.out.print("\n    -> password: " + password);
            System.out.print("\n    -> email: " + email);
        }
        rs.close();
        stmt.close();
        conn.close();
    }
}
