<%@page import="conndb.DB_Product"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List "%>
<%@page import="objs.OLX" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<%

   HttpSession get_session = request.getSession(false); 

%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Insert title here</title>
        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
</head>
<body>


  
           <!--Start Navbar content -->
          <nav class="navbar navbar-expand-sm navbar-light" style="background-color:#786fa6; direction: ltr;" >
               <a class="navbar-brand" href="Home.jsp">Brand</a>
               <a href="AddProduct.jsp" class="btn btn-outline-warning btn-lg"> إضافة منتج جديد مجاناَ &emsp; <i class="fal fa-plus"></i></a> 
            
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
                 <span class="navbar-toggler-icon"></span>
               </button>

               <div class="collapse navbar-collapse" id="navbarsExample03">
                 <ul class="navbar-nav mr-auto">
                   <li class="nav-item active">
                     <div class="nav-link"> </div>
                   </li>
                   <li class="nav-item active">
                     <div class="nav-link"> </div>
                   </li>
                   
<% if(get_session.getAttribute("id_user") != null){ %>
                   
                   <li class="nav-item">
                   <div class="nav-link">
                       <a href="MyProf.jsp" class="btn btn-primary btn-lg">
                           حسابي</a>
                   </div>
                   </li>
                   
<% } %>        
                   <li class="nav-item">
                    <div class="nav-link">
                       <a href="PrivewOLX.jsp" class="btn btn-info btn-lg">
                           عرض منتجات من OLX
                       </a>
                       </div>
                   
                 </ul>
                 
                  <div class="navbar-text">
                    <% if(get_session.getAttribute("id_user") == null){ %>
					      
					     
                           <a href="index.jsp" > تسجيل الدخول  </a>
					       أو قم 
					       <a href="SginIn.jsp" > بإنشاء حساب</a>
					      <% }else{ %>
					    
					     <form action="LogOutServlet" method="post" >
					        <input type="submit" class="btn btn-outline-danger btn-lg" name="logout" value="تسجيل الخروج" >
					     </form>
                        
					     <% } %>
					     </div>
                 
               </div>
             </nav>
  
  <!-- End Navbar content -->



          <div class="album py-5 bg-light">
            <div class="container">
          <div class="row">
<%

       List<OLX> list = DB_Product.getOLXProducts_olx();

        for(OLX o:list){
             
%>

                <div class="col-md-4">

                  <div class="card mb-4 box-shadow">

                  
                    <img class="card-img-top"   src="<%out.println(o.getImgURL()); %>"   alt="Card image cap"></img>
                    <div class="card-body">
                   
                   <h3 class="card-title">
                    <a href="#" >
                             <% 
                              out.println(o.getName());
                             %>
                   </a>
                   </h3>
                     
                      
                       
                           <h5 style="color:green"><% out.println(o.getPrice()); %></h5>
                        
                      <div class="d-flex justify-content-between align-items-center">
                        
                           <br>
                            <p class="card-text"><small class="text-muted">3 mins </small></p>
                        

                        
                      </div>
                    </div>
                    
                  </div>
                </div>

<%
         } 
%>      
                
                 </div>           
        </div>
     </div>


 <script src="static/js/jquery-3.3.1.slim.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"  crossorigin="anonymous"></script>
    <script src="static/js/bootstrap.min.js" ></script>
    
</body>
</html>