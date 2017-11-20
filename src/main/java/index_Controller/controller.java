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
        return "main_page/index";
    }

    @RequestMapping(value = "/adapt", method = RequestMethod.GET)
    public String adapt() {
        return "adapt_page/adapt";
    }

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String show() throws SQLException {

        db.showAllUser();
        return "member_page/register";
    }
}