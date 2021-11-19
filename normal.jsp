<%@page import="com.vamshi.Eshopp.helper.FactoryProvider"%>
<%@page import="com.vamshi.Eshopp.helper.Helper"%>

<%@page import="com.vamshi.Eshopp.entities.User"%>
<%

User user=(User)session.getAttribute("current-user");
if(user==null)
{
	session.setAttribute("message", "you are not logged in");
	response.sendRedirect("login.jsp");
	return;
}


%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@include file="components/common_css_js.jsp"  %>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@include file="components/navbar.jsp" %>

<%@include file="components/common_css_js.jsp"  %>


<h2></h2>

<div class="container-fluid">

<div class="row mt-3 mx-2" >
<%


  String c= request.getParameter("category");
//out.print(c);


ProductDao dao= new ProductDao(FactoryProvider.getFactory());


List<Product> list=null;
if(c==null||c.trim().equals("all"))
{
	list=dao.getAllProducts();
}
else
{
	int cid=Integer.parseInt(c.trim());
	list=dao.getAllProductsById(cid);
}


  CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
  
       List<Category> clist=cdao.getCategories();
%>

<!--Categories -->

<div class="col-md-0">
<div class="list-group">
  <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
    All Products
  </a>


  
   <%
//for(Category cat:catlist)
//{
%>




</div>

</div>

<!-- products -->
<div class="col-md-12">

<!-- rows :4 -->
<div class="row mt-4">

<!-- columns :12 -->
<div class="col-md-12">

<div class="card-columns">

<!-- traversing products -->
<%
for(Product pro:list){
%>

<!-- product card -->

<div class="card product-card">
<div class="container text-center" >
<!-- Photos -->
<img alt="img/products"  class="card-image-top m-2" style="max-height:200px; max-width:100%; width: auto;" src="img/products/<%=pro.getpPhotos()%>"   >
</div>
<div class="card-body">

<h5><%=Helper.get15words(pro.getpTitle())%></h5>
<p><%=Helper.get10words(pro.getpDescription())%></p>


</div>



<div class="card-footer text-center">
<button class="btn custom-bg text-white" onclick="add_to_cart(<%=pro.getpId()%>,'<%=pro.getpTitle()%>' , ' <%=pro.getpPrice()%>')">Add to Cart</button>
<button class="btn btn-outline-success">&#8377;<%=pro.getPriceAfterDiscount()%> /-  <span class="text-secondary discount-label">   &#8377;<%=pro.getpPrice() %>   <%=pro.getpDiscount() %> %off</span></button>
<form action="checkout.jsp">
 <button class="btn custom-nv text-white" style="text-align: left;" onclick="add_to_cart(<%=pro.getpId()%>,'<%=pro.getpTitle()%>' , ' <%=pro.getpPrice()%>')">Buy Now</button>
 </form>
</div>
</div>
<%
}
if(list.size()==0)
{
	out.println("<h3>"+"no item in this category"+"<h3>");
}

%>
</div>


</div>


</div>


</div>




</div>

</div>

<%@include file="components/common_modals.jsp" %>

</body>
</html>