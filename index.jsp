<%@page import="com.vamshi.Eshopp.helper.Helper"%>
<%@page import="com.vamshi.Eshopp.entities.Category"%>
<%@page import="com.vamshi.Eshopp.dao.CategoryDao"%>
<%@page import="com.vamshi.Eshopp.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.vamshi.Eshopp.dao.ProductDao"%>
<%@page import="com.vamshi.Eshopp.helper.FactoryProvider"%>
<html>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

<body>
<%@include file="components/common_css_js.jsp"  %>

<%@include file="components/navbar.jsp" %>



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
 <button class="btn btn-outline-primary custom-nv text-white " onclick="add_to_cart(<%=pro.getpId()%>,'<%=pro.getpTitle()%>' , ' <%=pro.getpPrice()%>')">Buy Now</button>
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
<!-- pagination-->
<nav aria-label="Page navigation example"  >
  <ul class="pagination justify-content-center pagination-lg">
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>

</div>

<%@include file="components/common_modals.jsp" %>
</body>
</html>