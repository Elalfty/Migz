<%@page import="conndb.DB_Product"%>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List "%>
<%@page import="objs.Product" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%
   HttpSession get_session = request.getSession(false); 
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
                 
    <!-- Fontaswom CSS -->
      <link rel="stylesheet" href="static/css/style.css">

    <title>Home</title>
  </head>
  <body>
  
 <!--  
 
                  <div class="nav-link">
                       <a href="addOLXproductsInDB?st=1" class="btn btn-info btn-lg">
                           إضافة منتجات من OLX
                       </a>
                       </div>
                 
  -->
  
  
  <!-- Start Navbar -->
  <nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top" >
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


<!-- start search bar -->
      <div class="searchbar">
        <div class="container">
            
            <form>
  <div class="form-row align-items-center">
  
          
    <div class="col-auto">
      <label class="sr-only" for="inlineFormInputGroup">أخبرنا عن ماذا تبحث؟..</label>
      <div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text"><i class="fa fa-search"></i></div>
        </div>
        <input id="search-P" style="width:22rem;" type="text" class="form-control" id="inlineFormInputGroup" placeholder="أخبرنا عن ماذا تبحث؟..">
      </div>
    </div>
  
        <div class="col-auto">
     <div class="input-group mb-2">
     
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01"><i class="fas fa-map-marker"></i></label>
  </div  >
  <select style="width:17rem;" class="custom-select" id="inputGroupSelect01">
    <option selected>إبحث عن المنطقة هنا...</option>
    <option value="1">القاهرة</option>
    <option value="2">Two</option>
    <option value="3">Three</option> 
       <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
        <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
        <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
  </select>
</div>
    </div>

 
      
    <div class="col-auto mr-auto" >
      <button id="search-btn" type="submit" class="btn btn-primary mb-2"><i class="fa fa-search"></i>بحث</button>
    </div>
  </div>
</form>
                         <hr>
            
            </div>    
        </div>
     </div>
<!-- end search bar -->


    <!-- Start Categories -->
      <div class="categories">
       <div class="container">
        <div class="row">
            
                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-mobile rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">موبايلات وإكسسوارتها </h4>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-laptop rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">إلكترونيات وأجهزة منزلية</h4>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-car rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">عربيات وقطع غيار</h4>
                    </div>
                 </div>
            
                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fas fa-motorcycle rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">دراجات ومعدات رياضية</h4>
                    </div>
                 </div>
            
            
                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-wheelchair rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">المنزل والحديقة </h4>
                    </div>
                </div>



                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-book rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">كتب وموسيقي وفنون</h4>
                    </div>
                 </div>
            
            <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-asterisk rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">الموضة</h4>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-child rounded-circle"></i>
                        </div>
                        <h4 class="cat-title"> الاطفال</h4>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image"><i class="fas fa-shield-alt rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">خدمات</h4>
                    </div>
                 </div>
            
            
                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-at rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">وظائف</h4>
                    </div>
                </div>

                <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fa fa-home rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">عقارات</h4>
                    </div>
                </div>
      

                  <div class="col-sm-6 col-md-3 col-lg-2">
                    <div class="categ text-center">
                        <div class="cat-image "><i class="fas fa-hand-holding-usd rounded-circle"></i>
                        </div>
                        <h4 class="cat-title">تبرعات</h4>
                    </div>
                </div>


          
            </div>
             <hr>
        </div>
      </div>
      
    <!-- End Categories -->

 

          
              <div class="container">


           <div class="row">
<%
        List<Product> list = DB_Product.getAllProducts();

        for(Product p:list){           
%>
<div class="col-sm-6 col-md-4" >

<div class="card" >
  <img class="card-img-top" src="getImg?img_id=<% out.println(p.getId()); %> " style="max-height:190px"  alt="Card image cap">
  <div class="card-body">
    <h2 class="card-title">  
       <a href="PrivewProduct.jsp?idp=<% out.println(p.getId()); %> " >
                             <% 
                              out.println(p.getShortName());
                             %>
         </a>
      </h2>
      <h5 style="color:green"><% out.println(p.getPrice_Double()); %>LE</h5>
       <p class="card-text"><%out.println(p.getCity()); %></p>
        <p class="card-text"><small class="text-muted">3 mins </small></p>
  </div>
</div>
</div>

<%
         } 
%>      
    
</div>
    </div>






 <footer class="footer">
      <div class="container center">
        <div class="row justify-content-center">
          <a class="nav-link js-scroll-trigger" href="">MEGOO &copy; 2018</a>
        </div>
      </div>
    </footer>
    


		<!-- Scripts -->
  

   <script src="static/js/jquery-3.3.1.slim.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" ></script>
   <script src="static/js/bootstrap.min.js" ></script>
    <script >

    </script>
  </body>
</html>
