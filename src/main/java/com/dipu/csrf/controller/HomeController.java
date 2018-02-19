package com.dipu.csrf.controller;

import  com.dipu.csrf.user.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/")
    public String login(HttpServletRequest request) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    	String username="";
    	if (principal instanceof CustomUser) {
    		username = ((CustomUser)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
    	request.getSession(false).setAttribute("User",username);
        return "success";
    }
    
   
    

    @RequestMapping(value = "/home")
    @ResponseBody
    public String get() {
        return "You Are in /home with CSRF";
    }

   

}
