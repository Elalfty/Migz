
<%@page import="conndb.User_DB"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conndb.DB_Product "%>
<%@page import="objs.Product" %>
<%@page import="objs.User"%>
<%@page import="javax.servlet.http.HttpSession" %>

<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%

   HttpSession get_session = request.getSession(false); 

%>   
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
        <!-- Fontaswom CSS -->
      <link rel="stylesheet" href="static/css/fontawesome-all.min.css">
<style>
   .prof{padding-top:20px;}
   .card img{
       max-height:230px;
      max-width:700px;
       margin: 0 auto;
   }
</style>
    <title>Hello, world!</title>
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
 </div></nav>
<!-- End Navbar   -->
  
   
    <%
      
      String id_str = request.getParameter("idp"); 
      
          if(id_str != ""  &&  DB_Product.isInDB(id_str)){
        	
        Product p  =  DB_Product.getProduct_BYid(id_str);
        User user =null;
        boolean usrbool=false;
        if(p.getUser_Id()!=0){
        	user =User_DB.getUserBYID(String.valueOf(p.getUser_Id()));
        	usrbool=true;
        }
        

        
%>
      <div class="container prof">
    <div class="row"  style="margin-top: 42px;">
		<div class="col-md-8">
            <div class="well well-sm">
                <div class="media">
                    <a class="thumbnail pull-left" href="#">
                        <img class="media-object" src="<% if(usrbool)out.println("getImgProf?img_id="+user.getId()); else out.println("https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg");%>"  style="height:150px;width:150px;margin: 0 15px 15px 0;" >
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading"><% if(usrbool)out.println(user.getUsername()); else out.println(p.getAdvName()); %></h4>
                		<p><span class="label label-info"><% if(usrbool)out.println(user.getPhone()); else out.println(p.getPhone()); %></span> 
                		<br><span class="label label-warning"><% if(usrbool)out.println(user.getEmail()); else out.println(p.getEmail()); %></span></p>
                        <p>
                            <a href="#" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-comment"></span> زيارة البروفايل</a>
                            <a href="#" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-heart"></span> إعلانات أخري لنفس البائع</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

    
    <div class="card text-center">
      <div class="card-body">
    <div class="card mb-3">
  <img class="card-img-top" src="getImg?img_id=<% out.println(p.getId()); %> "  alt="Card image cap" >
  <div class="card-body">
   <h2> <% out.println(p.getProductName());  %> </h2>
    <p class="card-text"><% out.println(p.getDes());%>.</p>
    <p class="card-text"><span style="color:green " ><% out.println(p.getPrice_String()); %>LE</span></p>
  </div>
</div>

  </div>
</div>
    

  <%
          }
          else {
      
  %> 
           <h2>404 Erorr</h2>
  <%  	  
  
          } 
   %>
    <script src="static/js/jquery-3.3.1.slim.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js" ></script>
    
    
  </body>
</html>
