<%-- 
    Document   : view
    Created on : 20-Feb-2020, 07:46:10
    Author     : Dell
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.beans.User"%>
<%@page import="com.daos.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Users</title>
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon"/>
         
        <jsp:include page="base.jsp"></jsp:include>
        
        <script type="text/javascript"> 
            function confirmation(){
               if(confirm("Do you Really want to Remove this record ??"))
               {
                   return true;
               }
               else{
                   return false;
               }
            }
        </script>
        </head>
        <body>
        <%!
            UserDao ud=new UserDao();
             
            int start=0;
            int end = 3;
            int total=ud.getRecordsCount();
            %>
            <div class="container">
                <div  class="row">
                    <div class="col col-md-12">
                        <center>
                            <h2>list of Users</h2>
                            <table class="table table-hover">
                                <tr>

                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Father's Name</th>
                                    <th>Userid</th>
                                    <th>DOB</th>
                                    <th>Gender</th>
                                    <th>Hobbies</th>
                                    <th>Photo</th>
                                    <th>Operations</th>
                                </tr>
                            <%
                                if (request.getParameter("start")!=null)
                                    start = Integer.parseInt(request.getParameter("start"));
                                ArrayList<User> records = ud.getRecordByLimit(start, end);
                                
                   for (User user : records) {%>
                            <tr>
                                <td><%=user.getId()%></td>
                                <td><%=user.getName()%></td>
                                <td><%=user.getFname()%></td>
                                <td><%=user.getUserid()%></td>
                                <td><%=user.getDob()%></td>
                                <td><%=user.getGender()%></td>
                                <td><%=user.getHobbies()%></td>
                                <td><img src="<%=user.getPhoto()%>" style="width:64px; height: 64px;" class="img img-thumbnail"/></td>
                                <td><a href="edit.jsp?id=<%=user.getId()%>" class="btn btn-success"> <i class="fa fa-pencil" aria-hidden="true"></i>
 </a>   <a href="UserController?op=delete&id=<%=user.getId()%>" class="btn btn-danger" onclick="return confirmation();"><i class="fa fa-trash"></i></a></td>
                            </tr>
                            <%}%>

                        </table>
                            <span>
                                <center>
                                <a href="view.jsp?start=<%=start-end%>" class="btn btn-primary <%if(start==0)out.println(" disabled"); %>" style="float:left"><< Previous</a>
                                <a href="view.jsp?start=<%=start+end%>" class="btn btn-primary <%if(total-start <= end) out.println(" disabled");%>" style="float: right">Next >></a>
                                
                                <%for(int i=0; i<=total/end;i++){%>
                                <a href="view.jsp?start=<%=i*end%>" class="btn btn-success <%if(i==Math.floor(start/end))out.println(" btn-dark");%>">Page<%=i+1%></a>
                                <%}%>
                                </center>
                            </span>      
                        <br/>
                        <br/><br/>
                        <a href="reg1.jsp" class="btn btn-primary"><i class="fa fa-plus"> Add More Records </i></a>
                    </center>
                </div>
            </div>
        </div>

    </body>
</html>
