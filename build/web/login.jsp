<%-- 
    Document   : login
    Created on : 23-Feb-2020, 11:14:50
    Author     : Dell
--%>

<%@page import="com.daos.AdminDao"%>
<%@page import="com.beans.Admin"%>
<%@page import="com.daos.ReporterDao"%>
<%@page import="com.beans.Reporter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
<style>
  
html,body{
background-image: url('assets/images/544750.jpg');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}

.container{
height: 100%;
align-content: center;
}

.card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}
 </style>
    </head>
    <body>
        <%
            String userid="";
            String password= "";
            Cookie cookies[] = request.getCookies();
            for(Cookie c : cookies){
                if (c.getName().equals("userid"))
                    userid=c.getValue();
                if(c.getName().equals("password"))
                    password=c.getValue();
            }
            %>
    
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
                        <div class="d-flex justify-content-center h-100" style="margin-top: 15%">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
                                <br/>
                                <span id="s1">
                                <% if (request.getParameter("msg")!=null)
                                    out.println("<font color='red' size='4'>"+request.getParameter("msg")+"</font>" );
                                %>
                                </span>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
                            <form method="post">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
                                            <input type="text" class="form-control" placeholder="username" name="userid" required="required"  onfocus="s1.innerHTML='';" autocomplete="off" value="<%=userid%>">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
                                            <input type="password" class="form-control" placeholder="password" name="password" required="required" value="<%=password%>">
					</div>
                                        
                                        <div style="color:white; text-align: justify">
                                            <input type="radio" name="role" value="adminLogin" />Login as Admin
                                            <input type="radio" name="role" value="reporterLogin"/>Login as Reporter
                                        </div>
                                        
					<div class="row align-items-center remember">
                                            <input type="checkbox" name="remember" value="yes">Remember Me
					</div>
					<div class="form-group">
                                            <input type="submit" value="Login" name="submit" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="#">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
		</div>
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

    
    
    <% 
    if(request.getParameter("submit")!=null) {
        userid = request.getParameter("userid");
        password = request.getParameter("password");
        String role = request.getParameter("role");
        
        if (role==null){
              response.sendRedirect("login.jsp?msg=Please Select any Role");
              return;
        }
        
        if(role.equals("reporterLogin")){
            ReporterDao rd = new ReporterDao();
            Reporter reporter = rd.getByLoginData(userid, password);
            if (reporter!=null)
            {
                session.setAttribute("reporter", reporter);
                response.sendRedirect("reporter/dashboard.jsp");
            }
            else 
                response.sendRedirect("login.jsp?msg=Invalid Userid or Password");
        }
      if (role.equals("adminLogin")) {
            AdminDao ad = new AdminDao();
            Admin admin = ad.validateAdmin(userid, password);
            if(admin!=null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("admin/dashboard.jsp");
            }
            else {
                 response.sendRedirect("login.jsp?msg=Invalid Userid or Password");
            }
        }
    }
    
    %>
</html>
