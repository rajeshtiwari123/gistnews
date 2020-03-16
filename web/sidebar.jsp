<%@page import="com.daos.NewsDao"%>
<%@page import="com.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.CategoryDao"%>
<div class="col-lg-3">

        <h4 class="my-4">News Categories</h4>
        <div class="list-group">
            <% 
                NewsDao  nd = new NewsDao(); 
                CategoryDao cd = new CategoryDao();
                ArrayList<Category> catList = cd.getAllRecords();
                for(Category c : catList){%>
                <a href="#" class="list-group-item"><%=c.getName()%> <span class="badge badge-secondary"><%=nd.getApprovedCount(c.getId())%> </span></a>
          <%}%>
        </div>

      </div>