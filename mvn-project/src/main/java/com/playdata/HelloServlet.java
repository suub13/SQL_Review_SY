package com.playdata;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        // url: host:port/path?name=value&name=value...
        String count_ = req.getParameter("count");
        int count = 1;
        if (count_ != null && count_.length() > 0) count = Integer.parseInt(count_);
        for(int i=0; i< count; i++){
            out.print("Hello <br>");
        }


    }
}
