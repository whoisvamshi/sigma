<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp"  %>

</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="" style="background-image: url('signinas.jpg'); " >

<div class="container-fluid">
<div class="row mt-5">
<div class="col-md-4 offset-md-4">

<div class="card">
<%@include file="components/message.jsp" %>

<div class="card-body px-5">

<div class="container text-center">

<img alt="" src="signin.jpg.png" style="max-width:100px">
</div>

 <h3 class="text-center mg-3">Sign Up here</h3>

<form action="RegisterServlet" method="post">

<div class="form-group">
    <label for="name">User Name</label>
    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
  </div>
  
  <div class="form-group">
    <label class="control-label" for="email">
    User Email
    </label>
    <div class="input-group">
    <div class="input-group-addon">
    <span class="glyphicon glyphicon-envelope"></span>
    </div>
        <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
    
    </div>
  </div>

<div class="form-group">
    <label for="password">User Password</label>
    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
  </div>
    
  <div class="pd-telephone-input">
    <label for="phone">User  Phone</label>
    <input name="user_phone" type="tel" class="form-control" id="phone" name="phone" pattern="+[0-9]{2} [0-9]{10}" placeholder="+91 9999999999">
  </div>
  
  <div class="form-group">
    <label for="name">User Address</label>
<textarea name="user_address" style="height: 150px" class="form-control" placeholder="Enter your Address"></textarea>

  </div>
  
  
  <div class="container text-center">
  <button class="btn btn-outline-success">Register</button>
  <button class="btn btn-outline-warning">Reset</button>
  
  
  </div>
</form>

</div>

</div>


</div>

</div>
</div>
</div>

</body>
</html>