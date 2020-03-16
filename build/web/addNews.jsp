<%-- 
    Document   : dashboard
    Created on : 07-Mar-2020, 08:44:47
    Author     : Dell
--%>

<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.News"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <title>Reporter Home</title>
     <jsp:include page="base.jsp"></jsp:include>
  <!-- Custom styles for this template -->
  
  
   
        <script>

                function readURL(input,preview) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }
                </script>
  </head>

  <body>
<%
if(session.getAttribute("reporter")==null){
    response.sendRedirect("../login.jsp");
    return ;
} 
%>  

      
      
  <jsp:include page="navbar.jsp"></jsp:include>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <jsp:include page="sidebar.jsp"></jsp:include>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
            <%-- <jsp:include page="reportbar.jsp"></jsp:include>--%>
          <jsp:useBean class="com.beans.News" id="news" scope="session"></jsp:useBean>
    <center>
        <div class="container">
            <div class="row">
                <div class="col-md-3" style="position: fixed;right:0px;">
                    <%if (request.getParameter("submit")!=null){ 
                        String catids[] = request.getParameterValues("category");
                        String categories = "";
                        for (String id : catids)
                            categories += id +",";
                        session.setAttribute("catids", catids);
                        request.setAttribute("categories",categories);
                    %>
                    <jsp:setProperty name="news" property="*"></jsp:setProperty>
                    <form action="../NewsController?op=add" method="post" enctype="multipart/form-data">
                    <img scr="" style="width:200px; height: 200px;" id="preview" class="form-control"/> <br/>
                    <input type="file" name="image" onchange="readURL(this,preview);" class="form-control btn btn-success"/> <br/>
                    <input type="submit" value="Save to Data base " class="btn btn-primary" name="submit"/>
                    </form>
                    <%
                }%>
                </div>
                
                
                
                <div class="col col-md-9">
                    <form method="post" class="form">
                        <table class="table" width="100%">
                            <tr><th colspan="2"><center><h2>Add News Here </h2></center></th></tr>
                            <tr>
                                <td width="30%">Enter News Title </td>
                                <td><input type="text" name="title" class="form-control" value="${news.title}"/></td>
                            </tr> 
                             <tr>
                                <td>Enter Description </td>
                                <td><textarea name="description" rows="10" cols="20" class="form-control">
                                        ${news.description}
                                    </textarea> 
                               </td>
                            </tr> 
                            <tr>
                                <td>Select Categories </td>
                                <td>
                                    <%
                                        CategoryDao cd = new CategoryDao();
                                        ArrayList<Category> catList = cd.getAllRecords();
                                        String categories = request.getAttribute("categories")!=null ? (String)request.getAttribute("categories"):"";
                                        for(Category cat : catList){%>
                                        <input type="checkbox" name="category" value="<%=cat.getId()%>"  <%if(categories.contains(String.valueOf(cat.getId())))out.println(" checked");  %>/>  <%=cat.getName()%> 
                                       <%}  %>
                                </td>
                            </tr>
                            <tr>
                                <td>Select Uploaded Date </td>
                                <td><input type="date" name="uploaded_on" class="form-control" value="${news.uploaded_on}"/></td>
                            </tr>
                            <input type="hidden" name="reporter_id" value="${reporter.id}"/>
                            <input type="hidden" name="status" value="Pending"/>
                            <input type="hidden" name="status_text" value="Pending for Approval By Admin"/>
                        </table>
                            <input type="submit" value="save and Next" name="submit" id ="submit" class="form-control btn btn-primary"/>
                    </form>
                </div>
                
                 
            </div>
        </div>
    </center>
        
        </div>
 
        </main>
      </div>
    </div>
<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     
    <!-- Icons -->
    <script>
      feather.replace()
    </script>
 </body>
</html>
