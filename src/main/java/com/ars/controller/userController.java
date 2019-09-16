package com.ars.controller;

import com.ars.entity.User;
import com.ars.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class userController {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/user/login", method = RequestMethod.GET)
    public String index(){
        return "login";
    }

    @RequestMapping(value="/user/register", method = RequestMethod.POST)
    public String register(@ModelAttribute User user, Model model, @RequestParam(value="confirmPwd") String confirmPwd, HttpSession session){
        User record = userService.selectByUsername(user.getUsername());
        if(record != null){
            model.addAttribute("status", 1);
            return "login";
        }else if(!user.getPassword().equals(confirmPwd)){
            model.addAttribute("status", 2);
            return "login";
        }else{
            user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
            userService.insert(user);
            record = userService.selectByUsername(user.getUsername());
            session.setAttribute("user", record);
            return "index";
        }
    }
    @RequestMapping(value="/user/login", method = RequestMethod.POST)
    public String login(@ModelAttribute User user, Model model, HttpSession session){
        User record = userService.selectByUsername(user.getUsername());
        if (record != null && BCrypt.checkpw(user.getPassword(), record.getPassword())){
            session.setAttribute("user", record);
            return "index";
        }else{
            model.addAttribute("status", 0);
            return "login";
        }
    }
    @RequestMapping(value="/user/logout", method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "index";
    }
}
