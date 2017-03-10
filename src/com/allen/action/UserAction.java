package com.allen.action;

import com.allen.entity.User;
import com.allen.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by ad on 2017-02-10.
 *
 */
@Controller
@RequestMapping(value="/user")
public class UserAction {

    private UserService userService;
   @Resource(name = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(method = RequestMethod.POST,value="/login")
    public String loginMethod(HttpSession session,User user) throws Exception{
        User sessionUser = userService.login(user);
        if (sessionUser != null) {
//            System.out.println(sessionUser.getUsername()+"||"+sessionUser.getPassword());
            session.setAttribute("user",sessionUser);
            if("NPC".equals(sessionUser.getType())){
                return "redirect:tousu/Npc/index.jsp";
            }
//            ("Tasker".equals(sessionUser.getType()))
            else{
                return "redirect:tousu/tasker/index.jsp";
            }

        }else{
            return "redirect:/login.jsp";
        }
    }
    @RequestMapping(value="/loginOut")
    public String loginOut(HttpServletRequest request)throws Exception{
        HttpSession session = request.getSession(false);
        if(session!=null){
            session.removeAttribute("user");
        }
        return "redirect:/login.jsp";
    }
    @RequestMapping(value="/viewUpdate")
    public String viewUpdate(HttpSession httpSession,Model model) {
        User user = (User)httpSession.getAttribute("user");
        model.addAttribute("user",user);
        return "/tousu/viewUpdate.jsp";
    }
    @RequestMapping(value="/updatePass")
    public String updatePass(String mpass,String newpass,HttpSession httpSession,Model model){
        User user = (User)httpSession.getAttribute("user");
        if(mpass.equals(user.getPassword())){
            user.setPassword(newpass);
            userService.updateUser(user);
            model.addAttribute("message","更改成功");
            return "/public/info.jsp";
        }
        else{
            model.addAttribute("message","原始密码输入错误");
            return "/public/info.jsp";
        }
    }

}
