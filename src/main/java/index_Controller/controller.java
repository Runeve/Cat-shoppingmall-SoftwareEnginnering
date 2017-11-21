package index_Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.SQLException;

@Controller
public class controller {
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

    @RequestMapping(value = "/JoinForm", method = RequestMethod.GET)
    public String joinForm() {
        return "member_page/views/JoinForm";
    }
    @RequestMapping(value = "/JoinPro", method = RequestMethod.GET)
    public String joinPro() {
        return "member_page/pro/JoinPro";
    }

    @RequestMapping(value = "/LoginForm", method = RequestMethod.GET)
    public String LoginForm() {
        return "member_page/views/LoginForm";
    }

    @RequestMapping(value = "/LoginPro", method = RequestMethod.GET)
    public String LoginPro() {
        return "member_page/pro/LoginPro";
    }

    @RequestMapping(value = "/LogoutPro", method = RequestMethod.GET)
    public String LogoutPro() {
        return "member_page/pro/LogoutPro";
    }

    @RequestMapping(value = "/UserInfoForm", method = RequestMethod.GET)
    public String UserInfoForm() {
        return "member_page/views/UserInfoForm";
    }

    @RequestMapping(value = "/ModifyForm", method = RequestMethod.GET)
    public String ModifyForm() {
        return "member_page/views/ModifyForm";
    }

    @RequestMapping(value = "/ModifyPro", method = RequestMethod.GET)
    public String ModifyPro() {
        return "member_page/pro/ModifyPro";
    }

    @RequestMapping(value = "/DeleteForm", method = RequestMethod.GET)
    public String DeleteForm() {
        return "member_page/views/DeleteForm";
    }

    @RequestMapping(value = "/DeletePro", method = RequestMethod.GET)
    public String DeletePro() {
        return "member_page/pro/DeletePro";
    }

    @RequestMapping(value = "/ChangePsForm", method = RequestMethod.GET)
    public String ChangePsForm() {
        return "member_page/views/ChangePsForm";
    }

    @RequestMapping(value = "/ChangePsPro", method = RequestMethod.GET)
    public String ChangePsPro() {
        return "member_page/pro/ChangePsPro";
    }
}