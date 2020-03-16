<%-- 
    Document   : json2
    Created on : 14-Mar-2020, 09:23:17
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script> 
            function showNews(x,y){
                ajax =new XMLHttpRequest();
                ajax.open("GET", "http://newsapi.org/v2/everything?q="+ x +"&from=2020-02-14&sortBy=publishedAt&apiKey=951eb8ae5c074f42a7b053d6067525ef")
                ajax.send();
                
                ajax.onreadystatechange = function(){
                    if(this.readyState==4 && this.status==200){
                        //y.innerHTML = this.responseText;
                        newsObject = JSON.parse(this.responseText);
                        articles = newsObject['articles'];
                        for (i in articles){
                            artical = articles[i];
                            y.innerHTML +=" <h4>News - " + (i) + "</h4> <br/>" + artical.title +"<br/>" + artical.description +"<br/> <img src='"+ artical.urlToImage+"'width=100 height=100/>"; 
                            
                        }
                    }
                    
                };
    }
            </script>
    </head>
    <body>
        Enter Keyword to Search : <input type="text" id="keyword"/> 
        <input type="button" value="Search" onclick="showNews(keyword.value,p1)"/>
        <p id="p1">
            
        </p>
    </body>
</html>
