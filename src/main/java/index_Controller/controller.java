package index_Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.*;


@Controller
public class controller {

    static final String USERNAME = "root";
    static final String PASSWORD = "0829";
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/gomyammi";

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "main_page/index";
    }

    @RequestMapping(value = "/ddd", method = RequestMethod.GET)
    public String ddd() {
        return "main_page/ddd";
    }

    @RequestMapping(value = "/adapt", method = RequestMethod.GET)
    public String adapt() {
        return "adapt_page/adapt";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show() {
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
            System.out.println("\n- MySQL Connection");
            stmt = conn.createStatement();

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
        } catch (SQLException se1) {
            se1.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
            }
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        System.out.println("\n\n- MySQL Connection Close");
        return "member_page/register";
    }
}