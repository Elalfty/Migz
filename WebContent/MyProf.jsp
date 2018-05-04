<%@page import="conndb.User_DB"%>
<%@page import="objs.User"%>
<%@page import="javax.servlet.http.HttpSession" %>

<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>   
<%
   HttpSession get_session = request.getSession(false); 
     User user=null;
     boolean bool=false;
     
     if(get_session.getAttribute("id_user") != null)
     {
    	 bool=true;
    	 user = User_DB.getUserBYID(String.valueOf(get_session.getAttribute("id_user")));
     }
     
%>  

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    
        <!-- Fontaswom CSS -->
      <link rel="stylesheet" href="static/css/fontawesome-all.min.css">

               <!-- My CSS -->
    <link rel="stylesheet"  type="text/css" href="static/css/style.css"  >
<style>

body{padding-top:20px;margin-top:20px;}

</style>

    <title>Home</title>
  </head>
  <body>
  
     
  
  <!-- Start Navbar -->
  <nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top">
<div class="container">
   <a class="navbar-brand" href="Home.jsp">Brand</a>
   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
   </button>

   <div class="collapse navbar-collapse" id="navbarSupportedContent">
     <ul class="navbar-nav ml-auto">

          &ensp;&ensp;     
      <li class="nav-item">
            <a  class="nav-link add-prod" href="AddProduct.jsp"><i class="fa fa-plus fa-1x"></i> أضف إعلان مجانا</a>                                                                            
       </li>
         &ensp;&ensp;
         <li class="nav-item dropdown">
         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user-circle fa-1.5x"></i>
         </a>
         
<% if(get_session.getAttribute("id_user") != null){ %>
                   
         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="MyProf.jsp">حسابي </a>
                    <div class="dropdown-divider"></div>
            <form  class="text-center" action="LogOutServlet" method="post" >
					        <input type="submit" class="logout-btn" name="logout" value="تسجيل الخروج" >
					     </form>
         </div>
         
    <% }else{ %>    
                       
         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="index.jsp">تسجيل الدخول</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="SginIn.jsp">إنشاء حساب</a>
         </div>
         
    <% } %>    
      
       </li>
     
    </ul>
  </div>
 </div>
</nav>
<!-- End Navbar   -->
  
  
<% if(bool){ %>
<div class="container">
    <div class="row my-2 mrg">

                <div class="col-lg-4 order-lg-1 text-center">
                    <img src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg" id="imgProf" class="mx-auto img-fluid img-circle d-block" alt="avatar">
                    <h6 class="mt-2">Upload a different photo</h6>
                    <label class="custom-file">
                        <input type="file" id="file" class="custom-file-input" value="0">
                        <span class="custom-file-control">Choose file</span>
                    </label>
                </div>

        <div class="col-lg-8 order-lg-2">

            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
            <h3></h3>

                    <form role="form" enctype='multipart/form-data' action="UpdateUserProfServlet" method="post">

                        <div class="form-group row">
                          <label class="col-lg-3 col-form-label form-control-label">Username</label>
                          <div class="col-lg-9">
                              <input class="form-control" type="text" value="<% out.println(user.getUsername()); %>">
                          </div>
                      </div>

                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Email</label>
                            <div class="col-lg-9">
                                <input class="form-control" type="email" value="<% out.println(user.getEmail()); %>">
                            </div>
                            </div>

                            <div class="form-group row">
                              <label class="col-lg-3 col-form-label form-control-label">Phone</label>
                              <div class="col-lg-9">
                                  <input class="form-control" type="text" value="<% out.println(user.getPhone()); %>">
                              </div>
                          </div>

                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">City</label>
                                <div class="col-lg-9">
                                    <input class="form-control" type="text" value="<% out.println(user.getCity()); %>">
                                </div>
                                </div>

                                <div class="form-group row">
                                  <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                  <div class="col-lg-9">
                                      <input class="form-control" type="password" value="<% out.println(user.getPwd()); %>">
                                  </div>
                              </div>



                        <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label"></label>
                            <div class="col-lg-9">
                                <input type="button" class="btn btn-primary btn-block" value="Save Changes">
                                <input type="reset" class="btn btn-secondary btn-block" value="Cancel">
                          </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

<% }else{ %>

<h1>erorr 404 Not Found..</h1>

<% } %>
		<!-- Scripts -->


   <script src="static/js/jquery-3.3.1.slim.min.js"></script>
   <script src="static/js/popper.min.js" ></script>
   <script src="static/js/bootstrap.min.js" ></script>
   <script src="static/js/myProfPlugin.js"></script>

  </body>
</html>
