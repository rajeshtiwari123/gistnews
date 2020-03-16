 
package com.test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

 
public class SubjectController extends HttpServlet {
 
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
       
        String op = request.getParameter("op");
       
        try{
        if(op!=null && op.equalsIgnoreCase("add")){
            Connection con = null;
            PreparedStatement smt =null;
           try{
               Class.forName("com.mysql.jdbc.Driver");
               con =DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","aryan");
               con.setAutoCommit(false);
               String subjectName = request.getParameter("subject");
               String sql = "Insert into Subject(name)values(?)";
               smt= con.prepareStatement(sql);
               smt.setString(1, subjectName);
               smt.executeUpdate();
               
               //fetching the id if last inserted subject-
               sql = "Select id from subject order by id desc limit 1";
               smt = con.prepareStatement(sql);
               ResultSet rs = smt.executeQuery();
               int subjectId = -1;
               if(rs.next()){
                   subjectId = rs.getInt("id");
               }
               
               //make insertion inside realtionship table (scr)
               //fetch all the selected course ids
               String courseIds[] = request.getParameterValues("courseIds");
              
               for(String courseid : courseIds){
                   sql = "Insert into scr (subject_id, course_id) values(?,?);";
                   smt = con.prepareStatement(sql);
                   smt.setInt(1, subjectId);
                   smt.setInt(2, Integer.parseInt(courseid));
                   smt.executeUpdate();
               }
               
               con.commit();
               out.println("Insertion Completed ..");
           } catch(Exception e){
               System.out.println("Error : "+ e.getMessage());
               con.rollback();
           }finally{
               con.close();
               smt.close();
               
           }
            
        }
        }catch(Exception e){
            System.out.println("Error : "+ e.getMessage());
        }
    }
 
}
