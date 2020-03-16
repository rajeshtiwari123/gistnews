package com.controllers;

import com.beans.User;
import com.daos.UserDao;

import com.utilities.FileUploader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.Base64;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String op = request.getParameter("op");

        if (op != null && op.equalsIgnoreCase("delete")) {
           int id = Integer.parseInt(request.getParameter("id"));
           UserDao ud = new UserDao();
           if (ud.remove(id))
               response.sendRedirect("view.jsp");
        }

        if (op != null && op.equals("varify")) {
            String userid = request.getParameter("userid");
            if (userid == null || userid.equals("")) {
                out.print("<b> Plese fillout the userid</b>");
                return;
            } 
            UserDao ud = new UserDao();
             if (ud.isUseridExist(userid))  
                    out.println("<font color='red' size='4' face='corbel'>Sorry! this userid is not available</font>");
               
             else 
                    out.println("<font color='blue' size='4' face='corbel'> Congrats! this userid is available!</font>");
                
                
        }

        //response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String op = request.getParameter("op");

        if (op != null && op.equals("add")) {

            //check the enctype of the incomming request -
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String encodedPassword = "";
            String imagePath = "";
            HttpSession session = request.getSession();
            com.beans.User user = (com.beans.User) session.getAttribute("user");

            if (isMultipart)  
               imagePath = FileUploader.getUploadedPath(getServletContext(), "media/user", request);
             
            //JDBC Code 
            user.setPhoto(imagePath);
            encodedPassword = Base64.getEncoder().encodeToString(user.getPassword().getBytes("UTF-8"));
            user.setPassword(encodedPassword);
            com.daos.UserDao ud = new com.daos.UserDao();
            if (ud.add(user)) {
                session.removeAttribute("user");
                response.sendRedirect("view.jsp");
            }
        }

        if (op != null && op.equalsIgnoreCase("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String imagePath="";
            if (isMultipart)  
             imagePath = FileUploader.getUploadedPath(getServletContext(), "media/user", request);
             
            //jdbc:
            HttpSession session = request.getSession();
            UserDao ud = new UserDao();
            User user = (User)session.getAttribute("user");
            if(!imagePath.equals(""))
                user.setPhoto(imagePath);
            if(ud.update(user))
            {
                session.removeAttribute("user");
                response.sendRedirect("view.jsp");
            }
                   
                  
        }

        if (op != null && op.equalsIgnoreCase("login")) {
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");
            Connection con = null;
            PreparedStatement smt = null;
            String encodedpassword = Base64.getEncoder().encodeToString(password.getBytes("UTF-8"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining", "root", "aryan");
                String sql = "select * from user where userid=? and password=?";
                smt = con.prepareStatement(sql);
                smt.setString(1, userid);
                smt.setString(2, encodedpassword);

                ResultSet rs = smt.executeQuery();

                if (rs.next()) {
                    String remember = request.getParameter("remember");
                    if (remember != null && remember.equalsIgnoreCase("yes")) {
                        Cookie c1 = new Cookie("userid", userid);
                        Cookie c2 = new Cookie("password", password);
                        c1.setMaxAge(60 * 2);
                        c2.setMaxAge(60 * 2);
                        response.addCookie(c1);
                        response.addCookie(c2);
                    }
                    response.sendRedirect("dashboard.jsp?name=" + rs.getString("name"));
                } else {
                    response.sendRedirect("login.jsp?msg=Invalid Userid or Password");
                }

                con.close();
                smt.close();

            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }
        }
        /*
        //Retrieveing data using Enumeration:
        Enumeration form = request.getParameterNames();
        while(form.hasMoreElements()){
            String name =(String) form.nextElement();
            String values[] = request.getParameterValues(name);
            out.println(name + "  :  " );
            
            for (String s : values)
                out.println(s +"<br/>");
         */

    }
}
