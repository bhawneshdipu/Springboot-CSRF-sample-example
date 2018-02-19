package com.dipu.csrf.config;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import  com.dipu.csrf.user.*;
@Component
public class CustomAuthenticationProvider
  implements AuthenticationProvider {
 
    @Override
    public Authentication authenticate(Authentication authentication) 
      throws AuthenticationException {
  
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
         System.out.println(name+" Auth "+password);
        if(name.indexOf("hello")>=0 && password.equals("world")){
        	List<GrantedAuthority> authorities=new ArrayList<GrantedAuthority>();
        	
        	
            CustomUser user=new CustomUser();
            user.setUsername(name);
            user.setAuthorities(authorities);
            //ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();

            return new UsernamePasswordAuthenticationToken(user, password, authorities);
             	
        }else{
        	return null;
        }
      
    }
    

    public boolean supports(Class<?> arg0) {
        return true;
    }
 
   
}