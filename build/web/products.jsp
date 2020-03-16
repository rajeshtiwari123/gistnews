<%-- 
    Document   : products
    Created on : 28-Feb-2020, 07:29:04
    Author     : Dell
--%>

<%@page import="java.sql.Array"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Product,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        </head>
        <body>
        <%
            ArrayList<Product> products = new ArrayList();
            Product p = new Product(1, "Shoes", "Mens Shoe Rough and Tough", "media/products/shoe.jpg", 1234.55);
            products.add(p);

            p = new Product(2, "T-shirt", "Mens T-shirt Orange and Red ", "media/products/tshirt.jpg", 570);
            products.add(p);

            p = new Product(3, "WiFi Router", "Modem and Router with speed of 100MBPS", "media/products/modem.jpg", 2100);
            products.add(p);

            p = new Product(4, "Samsung Mobile", "Samasung Galaxy S20 with 64 Megapixel Camera", "media/products/mobile.jpg", 28000);
            products.add(p);

            session.setAttribute("products", products);
        %>

        
        <div class="container">
            <center>
            <div class="row">
                <div class="col col-md-12">
                    
                    <h2>My Shopping Site</h2>
              
                </div> 
                    <% for (Product product : products){%>
                    <div class="card col-md-4" style="padding: 10px; margin: 5px;">
                        <form action="showcart.jsp" method="post">
                      
                    <img class="card-img-top" src="<%=product.getImage()%>" alt="Card image" style="width:100%">
                    <div class="card-body">
                        <input type="hidden" name="id" value="<%=product.getId()%>"/>
                        <h4 class="card-title"><%=product.getName()%> </h4>
                        <p class="card-text"><%=product.getDescription()%></p>
                        <p><b>Price : <%=product.getPrice()%></b></p>
                        <p>Select Quantity :<input type="number" name="quantity" value="1" min="1" max="5"/></p>
                        <input type="submit" value="Add to Cart" class="btn btn-primary"/>
                    </div>
                        </form>
                        
             </div>
                    
                       <%}%>
           
            </div>
            </center>        
        </div>

    </body>
</html>
