
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Contct Us</title>

        <!-- Bootstrap core CSS -->
        <jsp:include page="base.jsp"></jsp:include>

            <style>

                body{
                    background: -webkit-linear-gradient(left, #0072ff, #00c6ff);
                }
                .contact-form{
                    background: #fff;
                    margin-top: 10%;
                    margin-bottom: 5%;
                    width: 70%;
                }
                .contact-form .form-control{
                    border-radius:1rem;
                }
                .contact-image{
                    text-align: center;
                }
                .contact-image img{
                    border-radius: 6rem;
                    width: 11%;
                    margin-top: -3%;
                    transform: rotate(29deg);
                }
                .contact-form form{
                    padding: 14%;
                }
                .contact-form form .row{
                    margin-bottom: -7%;
                }
                .contact-form h3{
                    margin-bottom: 8%;
                    margin-top: -10%;
                    text-align: center;
                    color: #0062cc;
                }
                .contact-form .btnContact {
                    width: 50%;
                    border: none;
                    border-radius: 1rem;
                    padding: 1.5%;
                    background: #dc3545;
                    font-weight: 600;
                    color: #fff;
                    cursor: pointer;
                }
                .btnContactSubmit
                {
                    width: 50%;
                    border-radius: 1rem;
                    padding: 1.5%;
                    color: #fff;
                    background-color: #0062cc;
                    border: none;
                    cursor: pointer;
                }
            </style>
        </head>

        <body>

            <!-- Navigation -->
        <jsp:include page="navbar.jsp"></jsp:include>

            <!-- Page Content -->
            <div class="container">

                <div class="row">

                <%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>
                <!-- /.col-lg-3 -->

                <div class="col-lg-12">
                    <%--<jsp:include page="slider.jsp"></jsp:include>--%>

                    <div class="row">
                            <div class="contact-form col col-md-9">
                                <div class="contact-image">
                                    <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
                                </div>
                                <form method="post">
                                    <h3>Drop Us a Message</h3>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input type="text" name="txtName" class="form-control" placeholder="Your Name *" value="" />
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="txtEmail" class="form-control" placeholder="Your Email *" value="" />
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="txtPhone" class="form-control" placeholder="Your Phone Number *" value="" />
                                            </div>
                                            <div class="form-group">
                                                <input type="submit" name="btnSubmit" class="btnContact" value="Send Message" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <textarea name="txtMsg" class="form-control" placeholder="Your Message *" style="width: 100%; height: 150px;"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        
                        
                        <div class="col-md-3" style="margin-top: 10%">
                            <h2>Our Address : </h2> 
                            <i>D-1 7, Nehru Nagar Bhopal. <br/>
                                Ph . : 0755-4208218. M. : 8878128218 <br> 
                                email : gisttechnosolutions@gmail.com</i>

                  
                    </div>
                        </div>


                    </div>
                    <!-- /.row -->

                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <jsp:include page="footer.jsp"></jsp:include>

        <!-- Bootstrap core JavaScript -->

    </body>

</html>
