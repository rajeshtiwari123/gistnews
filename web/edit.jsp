<%-- 
    Document   : edit
    Created on : 20-Feb-2020, 08:07:07
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
         <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    img1.src= e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
         
        
           
   </script>
            <style>
                img{
  max-width:180px;
}
input[type=file]{
padding:10px;
background:#2d2d2d;}
            </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col">
                     <%
         int id = Integer.parseInt(request.getParameter("id"));
         
            Connection con=null;
           PreparedStatement smt;
                
try{
   Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gisttraining","root","aryan");
   String sql = "select * from user where id=?";
   smt =con.prepareStatement(sql);
   smt.setInt(1, id);
   ResultSet rs = smt.executeQuery();
   if(rs.next()){%>
    
   <form action="UserController?op=update&id=<%=rs.getString("id")%>" method="post" class="form" enctype="multipart/form-data"> 
    <center>
        <h2> Update User's Data </h2>
        <table class="table bg-info"> 
            <tr>
                <td>Name </td>
                <td><input type="text" name="name" required="required" autocomplete="off" value="<%=rs.getString("name")%>"/> </td>
                <td rowspan="5">
                    <img src="<%=rs.getString("photo")%>" id="img1" class="img img-thumbnail" style="width:200px; height: 200px"/> <br/>
                    Change Profile Image<input type="file" name="photo" id="photo" onchange="readURL(this);" />
                </td>       
            </tr> <tr>
                <td>Father's Name </td>
                <td><input type="text" name="fname" required="required" value="<%=rs.getString("fname")%>"/> </td>
            </tr>
             <tr>
                <td>your DOB  </td>
                <td><input type="date" name="dob" value="<%=rs.getString("dob")%>" /> </td>
            </tr>
             <tr>
                <td>Your Gender </td>
                <td> <input type="radio" name="gender"  value="Male" <%if (rs.getString("gender").equalsIgnoreCase("Male"))out.println("checked='checked'"); %>  /> Male<br/>
                    <input type="radio" name="gender" value="Female" <%if (rs.getString("gender").equalsIgnoreCase("FeMale"))out.println("checked='checked'"); %> />Female<br/>
                </td>
            </tr> 
                <td>Selected Hobbies : </td>
                <td>
                    <input type="checkbox" name="hobbies" value="Dancing" <%if (rs.getString("hobbies").contains("Dancing"))out.println("checked='checked'"); %> />Dancing
                     <input type="checkbox" name="hobbies" value="Singing" <%if (rs.getString("hobbies").contains("Singing"))out.println("checked='checked'"); %>/>Singing <br/>
                    <input type="checkbox" name="hobbies" value="Cooking"  <%if (rs.getString("hobbies").contains("Cooking"))out.println("checked='checked'"); %>/>Cooking
                    <input type="checkbox" name="hobbies" value="Drawing"  <%if (rs.getString("hobbies").contains("Drawing"))out.println("checked='checked'"); %>/>Drawing
                 </td>
            </tr>
            
            <tr>
                 
                <th colspan="3">
                    <input type="reset" value="Clear" />
                    <input type="submit" value="Update"/> 
                </th>
            </tr>
            
         </table>
    </center>
        </form>
   <%}

con.close();
smt.close();
}
catch(Exception e){
    System.out.println("Error " + e.getMessage());
}
            

         %>
        
        
                </div>
            </div>
        </div>
       
    </body>
</html>
