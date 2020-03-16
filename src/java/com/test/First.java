 
package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class First extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("This is GET Request .....");
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<h2>This is Get Request</h2>");
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         System.out.println("This is POST request ");
         
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
       
        
        out.println("<h2>This is POST Request</h2>");
    
    }

    
}
