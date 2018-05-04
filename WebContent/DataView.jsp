

<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List "%>
<%@page import="conndb.User_DB "%>
<%@page import="objs.User" %>

<%@ page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
      
<title>Insert title here</title>
</head>
<body>



  
          <!-- Navbar content -->
          <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="Home.jsp">Brand</a>
               <a class="navbar-brand" href="Home.jsp">Home</a>
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
                     <a class="nav-link">
                     <img style="height:23px" src="data:image/jpeg;base64,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">
                     
                     </a>
                   </li>

                   <li class="nav-item active" style="padding-top:5px">
                     <a class="nav-link" href="#">Username <span class="sr-only">(current)</span></a>
                   </li>

                   <li class="nav-item active" style="padding-top:5px">
                     <a class="nav-link" href="#">Profile Settings <span class="sr-only">(current)</span></a>
                   </li>

                 </ul>
                 <form class="form-inline my-2 my-md-0">
                   <input class="form-control" type="text" placeholder="Search">
                 </form>
               </div>
             </nav>
  
  
  


<div class="card text-center">
  <div class="card-body">
<h5 class="card-title text-left">User Data View</h5>
<h5 class="card-title text-right">Home</h5>
<br>
 <table style="width:100%">
 
  <tr>
    <th>Id</th>
    <th>First Name</th>
    <th>Last Name</th>
    <th>User Name</th>
    <th>Password</th>
  </tr>
<% 
    

        List<User> users = User_DB.getAllUsers();
    
         for(User user:users)
         {
 %>
        	 <tr>
        	 
        	 <td> <% out.print(user.getId());       %> </td>
        	 <td> <% out.print(user.getUsername());    %> </td>
        	 <td> <% out.print(user.getEmail()); %></td>
        	 <td> <% out.print(user.getCity());      %></td>
        	 
        	 <td> <a href="editUser.jsp?id=<% out.print(user.getId());%>">Edit</a></td>
             <td> <a href="deleteUser.jsp?id=<% out.print(user.getId());%>">Delete</a></td>
        	 
        	 </tr>
         
         
         <% } %>


    
  

  
</table> 

    </div>
</div>
      <!-- jQuery first, then Popper.js, then Bootstrap JS -->
       <script src="static/js/jquery-3.3.1.slim.min.js"></script>
    <script src="static/js/popper.min.js"></script>
    <script src="static/js/bootstrap.min.js" ></script>
    
</body>
</html>
