
<%@page import="com.beans.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.daos.NewsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>News Homepage</title>

  <!-- Bootstrap core CSS -->
  <jsp:include page="base.jsp"></jsp:include>
</head>

<body>

  <!-- Navigation -->
<jsp:include page="navbar.jsp"></jsp:include>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

    <jsp:include page="sidebar.jsp"></jsp:include>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      <jsp:include page="slider.jsp"></jsp:include>
       
        <div class="row" id="news_section">

           <%
               NewsDao nd = new NewsDao();
               ArrayList<News> newsList =null;
               System.out.println("CAt id ="+ request.getParameter("catid"));
               int catid = request.getParameter("catid")!=null ?Integer.parseInt(request.getParameter("catid")):-1;
               if(catid!=-1){
                  newsList = nd.getNewsByCategory(catid);
               }
               else 
                   newsList = nd.getAllApprovedNews();
               for(News news:newsList){%>
               
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="<%=news.getImage()%>" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#"><%=news.getTitle()%></a>
                </h4>
                
                  <p class="card-text"><% if(news.getDescription().trim().length()>100) out.println(news.getDescription().trim().substring(0,99)+"..."); else out.println(news.getDescription().trim()); %> </p>
              </div>
              <div class="card-footer">
                  <a href="showDetailNews.jsp" class="btn btn-primary">View More</a>
              </div>
            </div>
          </div>
<%}%>
          
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->

  
  <script> 
      $("#search").click(function(){
          $.get("http://newsapi.org/v2/everything?q="+ $("#keyword").val() +"&from=2020-02-14&sortBy=publishedAt&apiKey=951eb8ae5c074f42a7b053d6067525ef",function(responseText){
              $("#news_section").html("");
              
              articles = responseText.articles;
              for(i in articles){
                  article = articles[i];
                  news ='<div class="col-lg-4 col-md-6 mb-4"> '+
            '<div class="card h-100">'+
              '<a href="#"><img class="card-img-top" src="'+ article.urlToImage +'" alt=""></a>'  +
             ' <div class="card-body">'+
                '<h4 class="card-title">' +
                  '<a href="#">'+ article.title +'</a>' +
               ' </h4>'+
                
                '  <p class="card-text">'+article.description +' </p>'+
              '</div>'+
              '<div class="card-footer">'+
                  '<a href="' + article.url+'" class="btn btn-primary">View More</a>'+
             ' </div>'+
           ' </div>'+
          '</div>';
          
          $("#news_section").append(news);
              }
              
          });
      });
      </script>
</body>

</html>
