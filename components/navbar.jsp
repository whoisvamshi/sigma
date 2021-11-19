<%@page import="com.vamshi.Eshopp.entities.Category"%>
<%@page import="com.vamshi.Eshopp.dao.CategoryDao"%>
<%@page import="com.vamshi.Eshopp.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.vamshi.Eshopp.helper.FactoryProvider"%>
<%@page import="com.vamshi.Eshopp.dao.ProductDao"%>
<%@page import="com.vamshi.Eshopp.entities.User"%>

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

<%

User user1=(User)session.getAttribute("current-user");


//for category
ProductDao pdao= new ProductDao(FactoryProvider.getFactory());


List<Product> plist =pdao.getAllProducts();



  CategoryDao catdao=new CategoryDao(FactoryProvider.getFactory());
  
       List<Category> catlist=catdao.getCategories();


 %>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  
  <div class="container">
  
  <a class="navbar-brand" href="index.jsp"><h8>SIGMA</h8><i class="fas fa-sigma"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        
        <%
for(Category cat:catlist)
{
%>
          <a class="dropdown-item" href="index.jsp?category=<%=cat.getCategoryId()%>"><%=cat.getCategoryTitle()%></a>
          <div class="dropdown-divider"></div>
          <%
          }
          %>
        </div>
      </li>
      
    </ul>
    <ul class="navbar-nav ml-auto">
    
     <li class="nav-item active">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"> <i class='fa fa-cart-plus' style="font-size: 25px;"><span class="ml-0 cart-items" style="font-size: 22px;">(0)</span></i>
         </a>
      </li>
    
    <%
    
    if(user1==null){
    %>
    
    <li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login </a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register</a>
      </li>
    
    <% 
    
    }else if(user1.getUserType().equals("admin"))
    { 
    	
    	%>
   
    <li class="nav-item active">
        <a class="nav-link" href="admin.jsp"> <%=user1.getUserName() %> </a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet ">Logout</a>
      </li>
   
   
  
     
    <% 
    
    }else
    { 
    	
    	%>
    
    
    <li class="nav-item active">
        <a class="nav-link" href="normal.jsp"> <%=user1.getUserName() %> </a>
      </li>
      
      
      
      <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet ">Logout</a>
      </li>
    
    <%
    }
    %>
    
    
     <li class="nav-item active" >
        <a class="nav-link" href="about.jsp">About us</a>
      </li>
    
    </ul>
    
  </div>
  
  </div>
</nav>