package com.playdata;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletResponse.setContentType("text/html; charset= UTF-8");
        servletResponse.setCharacterEncoding("UTF-8");
        servletRequest.setCharacterEncoding("UTF-8");
//        System.out.println("CharacterEncodingFilter의 앞부분 입니다.");
        filterChain.doFilter(servletRequest, servletResponse);
//        System.out.println("CharacterEncodingFilter의 뒷부분 입니다.");
//        ServletContext context = servletRequest.getServletContext();
    }
}
