<%-- 
    Document   : reporterReg
    Created on : 06-Mar-2020, 09:41:15
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.beans.Reporter"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporter Registration </title>
        <jsp:include page="base.jsp"></jsp:include>
        
        <script>

                function readURL(input,preview) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }
                </script>
    </head>
    <body>
    <jsp:useBean class="com.beans.Reporter" id="reporter" scope="session"></jsp:useBean>
    <center>
        <div class="container">
            <div class="row">
                <div class="col-md-3" style="position: fixed;right:0px;">
                    <%if (request.getParameter("submit")!=null){%>
                    <jsp:setProperty name="reporter" property="*"></jsp:setProperty>
                    <form action="../ReporterController?op=add" method="post" enctype="multipart/form-data">
                    <img scr="" style="width:200px; height: 200px;" id="preview" class="form-control"/> <br/>
                    <input type="file" name="image" onchange="readURL(this,preview);" class="form-control btn btn-success"/> <br/>
                    <input type="submit" value="Save to Data base " class="btn btn-primary" name="submit"/>
                    </form>
                    <%
                }%>
                </div>
                
                
                
                <div class="col col-md-9">
                    <form method="post" class="form">
                        <table class="table">
                            <tr><th colspan="2"><center><h2>Fill the Reporter Details Here </h2></center></th></tr>
                            <tr>
                                <td>Enter Reporter Name </td>
                                <td><input type="text" name="name" class="form-control" value="${reporter.name}"/></td>
                            </tr> 
                             <tr>
                                <td>Enter Reporter DOB </td>
                                <td><input type="date" name="dob" class="form-control" value="${reporter.dob}"/></td>
                            </tr> 
                             <tr>
                                <td>Select Gender  </td>
                                <td><input type="radio" name="gender" value="Male" ${reporter.gender eq "Male" ? "checked" : ""}/> Male 
                                <input type="radio" name="gender" value="Female" ${reporter.gender eq "Female" ? "checked" : ""}/> Female 
                                </td>
                            </tr> 
                            <tr>
                                <td>Enter Reporter's Contact </td>
                                <td><input type="text" name="contact" class="form-control" value="${reporter.contact}"/></td>
                            </tr> 
                            
                             <tr>
                                <td>Enter Reporter's Email </td>
                                <td><input type="email" name="email" class="form-control" value="${reporter.email}"/></td>
                            </tr> 
                            
                             <tr>
                                <td>Enter Reporter's Address </td>
                                <td><input type="text" name="address" class="form-control" value="${reporter.address}"/></td>
                            </tr> 
                            
                             <tr>
                                <td>Enter Reporter's Userid </td>
                                <td><input type="text" name="userid" class="form-control" value="${reporter.userid}"/></td>
                            </tr> 
                            
                             <tr>
                                <td>Enter Reporter's Password </td>
                                <td><input type="password" name="password" class="form-control" value="${reporter.password}"/></td>
                            </tr> 
                           
                            <input type="hidden" name="status" value="approved"/>
                        </table>
                            <input type="submit" value="save and Next" name="submit" id ="submit" class="form-control btn btn-primary"/>
                    </form>
                </div>
                
                 
            </div>
        </div>
    </center>
    </body>
</html>
