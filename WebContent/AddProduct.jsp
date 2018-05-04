<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@page import="conndb.DB_Product"%>
<%@page import="conndb.User_DB"%>
<%@page import="objs.User"%>

<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
<%

   HttpSession get_session = request.getSession(false); 

   HashMap<Integer,String>  map = DB_Product.getAllCATS();
   
   User user =null;
   boolean usrbool=false;
   if(get_session.getAttribute("id_user") != null){
   	user =User_DB.getUserBYID(String.valueOf(get_session.getAttribute("id_user")));
   	usrbool=true;
   }
  

%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

   <!-- Bootstrap CSS -->
    <link rel="stylesheet"  href="static/css/bootstrap.min.css">
      
   <!-- Bootstrap RTL CSS -->
    <link rel="stylesheet"  href="static/css/bootstrap-rtl.min.css">
    
        <!-- Fontaswom CSS -->
      <link rel="stylesheet" href="static/css/fontawesome-all.min.css">
    
       <!-- My CSS -->
    <link rel="stylesheet"  type="text/css" href="static/css/style.css"  >
    
</head>
  <body>

  
    
  
  <!-- Start Navbar -->
  <nav class="navbar navbar-expand-sm navbar-light bg-light fixed-top" style="direction: ltr">
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

<div class="container">
<div class="card text-center">
  <div class="card-header">
   <h2> أضف إعلان جديد مجانا </h2> 
  </div>
      <div class="card-body">
       <form action="UploadProduct" method="post" enctype='multipart/form-data'>
          <div class="form-group">
            <input type="text" class="form-control form-control-lg" name="nameP" id="exampleInputEmail1" placeholder="إسم المنتج.." >
            
            <span class="err"> <c:out value="${message['ProductName']}"/></span>
            </div>
            
            
              <div class="form-group">
                <select class="form-control form-control-lg"  id="exampleFormControlSelect1"  name="CAT">
                  <option value="0">إختر صنفا</option>
<% 
 for(Map.Entry<Integer,String> entry : map.entrySet()){ 
%>                  
                  
                  <option value=<% out.println(entry.getKey()); %>><% out.println(entry.getValue()); %></option>
<% 
} 
%>  
                </select>
                  <span class="err"><c:out value="${message['ProductCAT']}"/></span>
              </div>

          <div class="form-group">
            <textarea  class="form-control form-control-lg"  name="desp" id="exampleInputEmail1" placeholder="وصف الخدمة.."></textArea>
                 <span class="err"><c:out value="${message['ProductDes']}"/></span>
            </div>
            
       

          <div class="form-group">
            <label for="photo"> إختر صورة لتكون عنوانا لإعلانك:  </label>
            <input type="file" size="50" name="mainImg" placeholder="Upload Your Image" /><br>
          </div>
            <hr>
              <div class="form-group">
            <input type="text" class="form-control form-control-lg"  name="city" id="exampleInputEmail1" placeholder="المدينة.." value=<%if(usrbool){out.println('"'+user.getCity()+'"'); out.print("readonly");}%> ></input>
            <span class="err"><c:out value="${message['City']}"/></span>
            </div>
            
            
             <div class="form-group">
            <input type="text" class="form-control form-control-lg"  name="nameUser" id="exampleInputEmail1" placeholder="إسم المعلن.." value=<%if(usrbool){out.println('"'+user.getUsername()+'"'); out.print("readonly");}%>></input>
            <span class="err"><c:out value="${message['Name']}"/></span>
            </div>
            
            
             <div class="form-group">
            <input type="text" class="form-control form-control-lg"  name="phone" id="exampleInputEmail1" placeholder="رقم الهاتف.." value=<%if(usrbool){out.println('"'+user.getPhone()+'"'); out.print("readonly");}%>></input>
            <span class="err"><c:out value="${message['Phone']}"/></span>
            </div>
            
               
             <div class="form-group">
            <input type="text" class="form-control form-control-lg"  name="email" id="exampleInputEmail1" placeholder="الإيميل.." value=<%if(usrbool){out.println('"'+user.getEmail()+'"'); out.print("readonly");}%>></input>
            <span class="err"><c:out value="${message['Email']}"/></span>
            </div>
            
           
            <div class="form-group">
            <input type="text" class="form-control form-control-lg" name="pricep"  id="exampleInputEmail1" placeholder="سعر الخدمة..">
          <span class="err"><c:out value="${message['Price']}"/></span>
          </div>
          


<hr>
<div class="form-check form-check-inline">
  <input class="form-check-input"  type="checkbox"  id="inlineCheckbox1"  name="combo"  value="ido">
  <label class="form-check-label" for="inlineCheckbox1">
      &ensp;
      بنشرك للإعلان، أنت توافق على
      <a href="#">شروط الإستخدام </a>
       و 
      <a href="#">قواعد النشر</a>
      .
    </label>

</div>
    <br>
<span class="err"><c:out value="${message['combo']}"/></span>
<hr>
     <button type="button" class="btn btn-outline-primary btn-lg btn-block">مشاهدة الإعلان قبل النشر</button>

      <button type="submit" class="btn btn-outline-success btn-lg btn-block">نشر الإعلان</button>

         
        </form>


     
  </div>


  </div>
 

</div>



    <!-- jQuery first, then Tether, then Bootstrap JS. -->
        <script src="static/js/jquery-3.3.1.slim.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js" ></script>
    
     </body>
</html>
