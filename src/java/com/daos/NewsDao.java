
package com.daos;

import com.beans.Category;
import com.beans.News;
import com.pool.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.apache.commons.lang.StringEscapeUtils;

public class NewsDao {
      public boolean  add(News news, String[] catids){
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
      
       if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql = "Insert into news(title, description,uploaded_on,image,reporter_id,status,status_text)values(?,?,?,?,?,?,?)";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, news.getTitle());
            smt.setString(2,StringEscapeUtils.escapeHtml(news.getDescription()));
            smt.setString(3, news.getUploaded_on());
            smt.setString(4, news.getImage());
            smt.setInt(5, news.getReporter_id());
            smt.setString(6, news.getStatus());
            smt.setString(7, news.getStatus_text());
            if(smt.executeUpdate()>0) {
               sql = "Select id from news order by id desc limit 1";
               smt = con.prepareCall(sql);
               ResultSet rs = smt.executeQuery();
               int news_id = 0;
               if(rs.next())
                   news_id = rs.getInt("id");
              
               for(String cat_id : catids)
               {
                   sql = "insert into ncr (news_id,cat_id) values (?,?)";
                   smt = con.prepareStatement(sql);
                   smt.setInt(1, news_id);
                   smt.setInt(2, Integer.parseInt(cat_id));
                   smt.executeUpdate();
               }
               
            }
            con.commit();
            status=true;
            smt.close();
            //cp.putConnection(con);
        }   catch(Exception e){
            try{ con.rollback();
            System.out.println("DBError :"+e.getMessage());
            } catch(Exception ex){
                System.out.println("Rollback error :"+ex.getMessage());
                
            }
        }
        finally{
            cp.putConnection(con);
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
            String sql = "Delete from news where id=?";
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
   
   public News  getById(int id){
      News news=null;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, id);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return news;
   }
   
   public ArrayList<News>  getAllRecords(){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
   
   public ArrayList<News>  getAllApprovedNews(){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where status='approved' order by id desc";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
   
   public ArrayList<News>  getRecordByLimit(int start, int end){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news limit ?,?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, start);
            smt.setInt(2, end);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text")); 
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
  
   public int  getRecordsCount(){
    
       int total=0;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select count(*) from news";
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
   
   
 
   public int  getApprovedCount(int catid){
    
       int total=0;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select count(*) from news where status='approved' and id in(select news_id from ncr where cat_id=?) ";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(1, catid);
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
     
   
   public boolean  update(News news,String[] catids){
       boolean status=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql = "update news set title=?, description=?,image=? , status='pending', status_text='pending for approval by admin' where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, news.getTitle());
            smt.setString(2, news.getDescription());
            smt.setString(3, news.getImage());
            smt.setInt(4, news.getId());
            
            if(smt.executeUpdate()>0) {
                sql =  "delete from ncr where news_id=?";
                smt = con.prepareStatement(sql);
                smt.setInt(1, news.getId());
                smt.executeUpdate();
                
               for(String cat_id : catids)
               {
                   sql = "insert into ncr (news_id,cat_id) values(?,?)";
                   smt = con.prepareStatement(sql);
                   smt.setInt(1, news.getId());
                   smt.setInt(2,Integer.parseInt(cat_id));
                   smt.executeUpdate();
               }
               
            }
            con.commit();
            status=true;
            smt.close();
            //cp.putConnection(con);
        }   catch(Exception e){
            try{ con.rollback();
            System.out.println("DBError :"+e.getMessage());
            } catch(Exception ex){
                System.out.println("Rollback error :"+ex.getMessage());
                
            }
        }
        finally{
            cp.putConnection(con);
        }
       
       }
    return status;
   }
   
   public boolean  isTitleExist(String title){
       boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where title=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, title);
            ResultSet rs= smt.executeQuery();
            if(rs.next()){
                status=true;
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("DBError :"+e.getMessage());
        }
       }
       
       return status;
   }
   
   
   
   public ArrayList<News>  getNewsByCategory(int catid){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where id in(select news_id from ncr where cat_id =?)";
            PreparedStatement smt = con.prepareStatement(sql);
             smt.setInt(1, catid);
            
            ResultSet rs= smt.executeQuery();
           
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
   
   
   public ArrayList<News>  getNewsByReporter(int reporterid){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where reporter_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            smt.setInt(1, reporterid);
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
   
   public ArrayList<News>  getNewsByStatus(String status){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where status=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
    public ArrayList<News>  getNewsByStatus(String status,int reporterid){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news where status=? and reporter_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            smt.setInt(2, reporterid);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       
    return newss;
   }
   
   
   
   public ArrayList<News>  getTodayNews(){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       /*
       if(con!=null){
        try{
            String sql = "select * from news";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
      */ 
    return newss;
   }
  
 
   public ArrayList<News>  getRecentNews(){
    
       ArrayList<News> newss =new ArrayList<News>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       /*
       if(con!=null){
        try{
            String sql = "select * from news";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News  news =new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setDescription(rs.getString("description"));
                news.setImage(rs.getString("image"));
                news.setReporter_id(rs.getInt("reporter_id"));
                news.setUploaded_on(rs.getString("uploaded_on"));
                news.setStatus(rs.getString("status"));
                news.setStatus_text(rs.getString("status_text"));
                newss.add(news);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
       }
       */
       
    return newss;
   }
   
  public int  getCountByCategory(int catid){
    
       int total=0;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select count(*) from ncr where cat_id=?";
            PreparedStatement smt = con.prepareStatement(sql); 
            smt.setInt(1, catid);
           
           ResultSet rs= smt.executeQuery();
           if(rs.next()){
                total = rs.getInt(1);
            }
            smt.close();
            cp.putConnection(con);
        }   catch(Exception e){
            System.out.println("DBError :"+e.getMessage());
        }
       }
       
    return total;
   } 
   
  public int  getCountByReporter(int reporterid){
    
       int total=0;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select count(*) from news where reporter_id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setInt(reporterid, reporterid);
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
  
    public boolean  updateNewsStatus(int newsid, String status, String statusText){
       boolean sts=false;
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            con.setAutoCommit(false);
            String sql = "update news set status=?, status_text=? where id=?";
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, status);
            smt.setString(2, statusText);
            smt.setInt(3, newsid);
            smt.executeUpdate();
            con.commit();
            sts=true;
            smt.close();
            //cp.putConnection(con);
        }   catch(Exception e){
            try{ con.rollback();
            System.out.println("DBError :"+e.getMessage());
            } catch(Exception ex){
                System.out.println("Rollback error :"+ex.getMessage());
                
            }
        }
        finally{
            cp.putConnection(con);
        }
       
       }
    return sts;
   }
}
