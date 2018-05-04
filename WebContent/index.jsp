
<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
               <!-- My CSS -->
    <link rel="stylesheet"  type="text/css" href="static/css/style.css"  >
      
</head>
<body>

   <!-- Navbar content -->
          <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
             <a class="navbar-brand" href="Home.jsp">Brand</a>
               
               <a href="AddProduct.jsp" class="btn btn-outline-warning btn-lg "> إضافة منتج جديد مجاناَ &emsp; <i class="fal fa-plus"></i></a> 
    
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

                   <li class="nav-item">
                       <a href="PrivewOLX.jsp" class="nav-link">
                           عرض منتجات من OLX
                       </a>
                   </li>
                  
                 </ul>
                  
                  <span class="form-inline my-2 my-md-0">
                     
					     
					      <a href="SginIn.jsp" > إنشاء حساب</a>
					     
					     
                 </span>
                 
               </div>
             </nav>


<div class="container">
        
      <div class="card text-center">
  <div class="card-header">
    <h2>تسجيل الدخول</h2>
  </div>
  <div class="card-body">
      
<form action="LoginServlet" method="post">
    
    
    
  <div class="form-row">
    <div class="form-group col-md-12">
      <input type="email" name="email" class="form-control form-control-lg" id="inputEmail4" placeholder="االإسم او الإيميل" value="<c:out value="${val['email']}"/>">
     <span class="err"><c:out value="${message['email']}"/></span>
    </div>
      
    <div class="form-group col-md-12">
      <input type="password" name="pass" class="form-control form-control-lg" id="inputPassword4" placeholder="الباسورد" >
     <span class="err"><c:out value="${message['pwd']}"/></span>
    </div>
      
  </div>
 
<div class="form-check form-check-inline">
  <input class="form-check-input"  type="checkbox"  id="inlineCheckbox1"  name="combo"  value="ido">
  <label class="form-check-label" for="inlineCheckbox1">
      &ensp;
        تذكرني لاحقا..
    </label>

</div>
    <br>
       <br>
    
  <button type="submit" name="sginbtn" class="btn btn-outline-primary btn-lg btn-block">
      دخول
    </button>

    
  </form>

    
  </div>

</div>
</div>

    

   <script src="static/js/jquery-3.3.1.slim.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js" ></script>
  </body>
</html>
