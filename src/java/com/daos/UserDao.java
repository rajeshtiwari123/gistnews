 
package com.daos;
import com.beans.User;
import com.pool.ConnectionPool;
import java.sql.*;
import java.util.ArrayList;

public class UserDao {
   public boolean  add(User user){
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "Insert into user(name,fname,gender,dob,hobbies,userid,password,photo,contact)values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, user.getName());
            smt.setString(2, user.getFname());
            smt.setString(3, user.getGender());
            smt.setString(4, user.getDob());
            smt.setString(5, user.getHobbies());
            smt.setString(6, user.getUserid());
            smt.setString(7,user.getPassword());
            smt.setString(8, user.getPhoto());
            smt.setString(9, user.getContact());
            if(smt.executeUpdate()>0)
                status=true;
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return status;
   }
   
   
   
   public boolean  remove(int id){
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "Delete from user where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            
            if(smt.executeUpdate()>0)
                status=true;
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return status;
   }
   
   public User  getById(int id){
      User user=null;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from user where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                user =new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setFname(rs.getString("fname"));
                user.setDob(rs.getString("dob"));
                user.setGender(rs.getString("gender"));
                user.setHobbies(rs.getString("hobbies"));
                user.setUserid(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
                user.setPhoto(rs.getString("photo"));
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return user;
   }
   
   public ArrayList<User>  getAllRecords(){
    
       ArrayList<User> users =new ArrayList<User>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from user";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setFname(rs.getString("fname"));
                user.setDob(rs.getString("dob"));
                user.setGender(rs.getString("gender"));
                user.setHobbies(rs.getString("hobbies"));
                user.setUserid(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
                user.setPhoto(rs.getString("photo"));
                users.add(user);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return users;
   }
   
   
   
   public ArrayList<User>  getRecordByLimit(int start, int end){
    
       ArrayList<User> users =new ArrayList<User>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from user limit ?,?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, start);
            smt.setInt(2, end);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                User user=new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setFname(rs.getString("fname"));
                user.setDob(rs.getString("dob"));
                user.setGender(rs.getString("gender"));
                user.setHobbies(rs.getString("hobbies"));
                user.setUserid(rs.getString("userid"));
                user.setPassword(rs.getString("password"));
                user.setPhoto(rs.getString("photo"));
                users.add(user);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return users;
   }
   
  
   public int  getRecordsCount(){
    
       int total=0;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select count(*) from user";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                total = rs.getInt(1);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return total;
   }
   
   public boolean  update(User user){
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "update User set name=?,fname=?,gender=?,dob=?,hobbies=?,userid=?,password=?,photo=?,contact=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, user.getName());
            smt.setString(2, user.getFname());
            smt.setString(3, user.getGender());
            smt.setString(4, user.getDob());
            smt.setString(5, user.getHobbies());
            smt.setString(6, user.getUserid());
            smt.setString(7,user.getPassword());
            smt.setString(8, user.getPhoto());
            smt.setString(9, user.getContact());
            smt.setInt(10, user.getId());
            if(smt.executeUpdate()>0)
                status=true;
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return status;
   }
   
   public boolean  isUseridExist(String userid){
       boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from user where userid=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, userid);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                status=true;
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
       return status;
   }
   
   
   
   public boolean  isContactExist(String userid){
       boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from user where contact=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, userid);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                status=true;
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
       return status;
   }
}
