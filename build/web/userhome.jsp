<%-- 
    Document   : userhome
    Created on : 27-Feb-2020, 09:20:50
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
    <center>
        <h1> User Registration System Using Session ...</h1>
         <hr/>
        <table width="100%">
            <tr>
                <td><a href="reg.jsp" target="f1">Register</td>
                <td><a href="login2.jsp" target="f1">login</a></td>
                <td><a href="show1.jsp" target="f1">Show Basic details</a></td>
                <td><a href="show2.jsp" target="f1">Show Contact details</a></td>
                <td><a href="removeSession.jsp" target="f1">Remove Profile and Logout</a></td>
                <td><a href="logout.jsp" target="f1">Logout</a></td>
            </tr>
        </table>
        <hr/>
        <iframe width="100%" height="500" name="f1" style="border-style: none; border-width: 0px; border-collapse: collapse"></iframe>
        
    </center>
    </body>
</html>
