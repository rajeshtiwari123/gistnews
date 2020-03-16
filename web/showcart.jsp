<%-- 
    Document   : showcart
    Created on : 28-Feb-2020, 07:53:10
    Author     : Dell
--%>

<%@page import="javax.smartcardio.Card"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList,com.beans.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        </head>
        <body>
            You have selected product id <%=request.getParameter("id")%>

        <%
           ArrayList<Cart> mycart = (ArrayList) session.getAttribute("mycart") ;
            if(mycart==null)
                mycart = new ArrayList();
            
            int id =request.getParameter("id")!=null?Integer.parseInt(request.getParameter("id")):-1;
            int quantity = request.getParameter("quantity")!=null? Integer.parseInt(request.getParameter("quantity")):0;
            ArrayList<Product> products = (ArrayList) session.getAttribute("products");
            Product myproduct = null;
            
           
            for (Product product : products) {
                if (product.getId() == id) {
                    myproduct = product;
                }
            }
          
           if(myproduct!=null) {   
            boolean exist =false;
            Cart c =null; 
            
            for(int i=0; i<mycart.size(); i++) {
                Cart cc= mycart.get(i);
                if (cc.getProduct().getId() == myproduct.getId()) 
                {
                   exist=true; 
                   cc.setQty(cc.getQty()+quantity);
                   mycart.set(i, cc);
                   break;
                }
            }
              
                   
            
            if(!exist) {
            c = new Cart();
            c.setProduct(myproduct);
            c.setQty(quantity);
            mycart.add(c);
            }
           
       }     
            session.setAttribute("mycart", mycart);
            
        %>

        <div class="container">
            <center>
                <div class="row">
                    <div class="col col-md-6">
                        <table class="table">
                            <tr>
                                <th>Product id</th>
                                <th>Name </th>
                                <th>Image</th>
                                <th>Price </th>
                                <th>Quantity</th>
                                <th>Amount</th>
                                <th>Action</th>
                            </tr>
                            <%int index=0;  for (Cart cart : mycart){%>
                            <tr>
                                <td><%=cart.getProduct().getId()%></td>
                                <td><%=cart.getProduct().getName()%></td>
                                <td><img src="<%=cart.getProduct().getImage()%>" style="width:64px; height: 64px"/></td>
                                <td><%=cart.getProduct().getPrice()%></td>
                                <td><a href="#"><i class="fa fa-minus"></i></a> <%=cart.getQty()%>  <a href="#"><i class="fa fa-plus"></i></a></td>
                                <td><%=cart.getQty() * cart.getProduct().getPrice()%></td>
                                <td><a href="showcart.jsp?op=remove&index=<%=index++%>"><i class="fa fa-trash"></i></a></td>
                            </tr>
                            <%}%>
                        </table>
                        <br/>
                        <a href="products.jsp">Shop More</a>
                    </div>
                </div>
            </center>
        </div> 
                        
                        
                        <% 
                        String op = request.getParameter("op");
                        if (op!=null && op.equalsIgnoreCase("remove")){
                            mycart.remove(Integer.parseInt(request.getParameter("index")));
                            session.setAttribute("mycart", mycart);
                            response.sendRedirect("showcart.jsp");
                        }
                        
                        %>
    </body>
</html>
