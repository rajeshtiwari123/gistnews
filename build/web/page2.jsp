<%-- 
    Document   : page2
    Created on : 18-Feb-2020, 09:10:33
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
            String n3 = request.getParameter("n3")!=null ?request.getParameter("n3") : "";
            String n4 = request.getParameter("n4")!=null ?request.getParameter("n4") : "";
            %>
          <form action="result.jsp" method="post">
              <input type="hidden" name="n1" value="<%=n1%>"/>
              <input type="hidden" name="n2" value="<%=n2%>"/>
            <input type="text" name="n3" placeholder="No3"  value="<%=n3%>"/><br/><br/>
            <input type="text" name="n4" placeholder="No4" value="<%=n4%>"/><br/><br/>
            <a href="page1.jsp?n1=<%=n1%>&n2=<%=n2%>">Back </a>
            <input type="submit" value="Next"/>
        </form>
    </body>
</html>
