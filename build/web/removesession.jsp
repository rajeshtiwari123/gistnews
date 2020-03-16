<%-- 
    Document   : removeSession
    Created on : 27-Feb-2020, 09:14:57
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
            session.invalidate();
            session=null;
            response.sendRedirect("reg.jsp");
            %>
    </body>
</html>
