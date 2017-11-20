package index_Controller;

import database.Dao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;

@Controller
public class controller {

    private Dao db = new Dao();

    public controller() throws SQLException, ClassNotFoundException {
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "main_page/main";
    }

    @RequestMapping(value = "/adapt", method = RequestMethod.GET)
    public String adapt() {
        return "adapt_page/adapt";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "member_page/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "member_page/register";
    }
}