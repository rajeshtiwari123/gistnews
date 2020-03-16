<%-- 
    Document   : page1
    Created on : 18-Feb-2020, 08:50:00
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <%
            String n1 = request.getParameter("n1")!=null ?request.getParameter("n1") : "";
            String n2 = request.getParameter("n2")!=null ?request.getParameter("n2") : "";
             %>
        <form action="page2.jsp" method="post">
            <input type="text" name="n1" placeholder="No1" value="<%=n1%>"/><br/><br/>
            <input type="text" name="n2" placeholder="No2" value="<%=n2%>"/><br/><br/>
            
            <input type="submit" value="Next"/>
        </form>
    </body>
</html>
