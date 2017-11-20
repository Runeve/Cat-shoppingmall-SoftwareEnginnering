package index_Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;

@Controller
public class controller {

    //private MemberDAO db = new MemberDAO();

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

    @RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
    public String loginForm() {
        return "member_page/views/LoginForm";
    }
    @RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
    public String loginPro() {
        return "member_page/pro/LoginPro";
    }

    @RequestMapping(value = "/JoinForm", method = RequestMethod.GET)
    public String joinForm() {
        return "member_page/views/JoinForm";
    }
    @RequestMapping(value = "/JoinPro", method = RequestMethod.GET)
    public String joinPro() {
        return "member_page/pro/JoinPro";
    }
}