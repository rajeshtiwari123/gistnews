<%-- 
    Document   : show2
    Created on : 27-Feb-2020, 09:05:59
    Author     : Dell
--%>

<%@page import="com.test.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <h1>Contact Details are: </h1>
         <%
            Person  person = (Person)session.getAttribute("person");
            String islogin = (String) session.getAttribute("loggedin");
            if (person==null){
                response.sendRedirect("reg.jsp");
                return;
            }
            if (islogin==null ||  !islogin.equals("yes"))
            {
                response.sendRedirect("login2.jsp");
                return;
            }
           
            %>
            
            <h2>contact no.: ${person.contact} ><br/>
            Address : <%= person.getAddress() %> </h2>
    </body>
</html>
