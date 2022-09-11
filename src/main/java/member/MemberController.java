package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MemberController {

    @Autowired
    MemberDAO memberDAO;

    @GetMapping("/test")
    public String test(Model model) {

        List<MemberDTO> list = memberDAO.memberlist();

        System.out.println(list.get(0).getId());

        model.addAttribute("all", list.get(0).getName());
        return "login/test";
    }

}
