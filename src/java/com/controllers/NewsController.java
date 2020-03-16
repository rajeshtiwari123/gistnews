 
package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.beans.News;
import com.daos.NewsDao;
import com.utilities.FileUploader;
import javax.servlet.http.HttpSession;
 
public class NewsController extends HttpServlet {
 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       response.setContentType("text/html");
       String op=request.getParameter("op");
       
       if(op!=null && op.equalsIgnoreCase("add")){
           HttpSession session = request.getSession();
           News news = (News)session.getAttribute("news");
           String catids[] = (String[])session.getAttribute("catids");
           String imagePath="";
           imagePath = FileUploader.getUploadedPath(getServletContext(), "media/news", request);
           news.setImage(imagePath);
           NewsDao nd = new NewsDao();
           if(nd.add(news, catids)){
               session.removeAttribute("news");
               session.removeAttribute("catids");
               out.println("News Added ...");
           }
       }
    }

    
}
