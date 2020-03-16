<%-- 
    Document   : ajax1
    Created on : 22-Feb-2020, 08:08:03
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript"> 
            function showTable(x,y){
                y.innerHTML="";
                ajax = new XMLHttpRequest();
                ajax.open("GET","AjaxServlet?op=table&n="+x, true);
                ajax.send();
                
                ajax.onreadystatechange = function(){
                  if(this.readyState ==4 && this.status==200){
                      y.innerHTML = this.responseText;
                  }  
                };
         }
         
         function showSqr(x,y){
             y.innerHTML="";
                ajax = new XMLHttpRequest();
                ajax.open("GET","AjaxServlet?op=sqr&n="+x, true);
                ajax.send();
                
                ajax.onreadystatechange = function(){
                  if(this.readyState ==4 && this.status==200){
                      y.innerHTML = this.responseText;
                  }  
                };
         }
         
         function loadNames(x,y){
             y.innerHTML="";
              ajax = new XMLHttpRequest();
                ajax.open("GET","AjaxServlet?op=search&name="+x, true);
                ajax.send();
                
                ajax.onreadystatechange = function(){
                  if(this.readyState ==4 && this.status==200){
                      y.innerHTML = this.responseText;
                  }  
                };

         }
            </script>
    </head>
    <body>
        <form action="AjaxServlet">
            Enter a number to get Table: <input type="text" name="n" onblur="showTable(this.value,p1)"/><br/>
            Enter a number to get square :<input type="text" name="m" onblur="showSqr(this.value,p1)"/><br/>
            Enter Name to Search :<input type="text" name="name" list="list1" autocomplete="off" onkeyup="loadNames(this.value,list1);"/>
            
            <p id="p1"></p>
       
            <datalist id="list1">
              
            </datalist>
       
        </form>
    </body>
</html>
