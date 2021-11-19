<%@page import="java.util.Map"%>
<%@page import="com.vamshi.Eshopp.helper.Helper"%>
<%@page import="com.vamshi.Eshopp.dao.UserDao"%>
<%@page import="com.vamshi.Eshopp.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.vamshi.Eshopp.helper.FactoryProvider"%>
<%@page import="com.vamshi.Eshopp.dao.CategoryDao"%>
<%@page import="com.vamshi.Eshopp.entities.User"%>
	<%@include file="components/common_modals.jsp"%>

<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not logged in");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "you are not admin ! dont access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}

UserDao udao = new UserDao(FactoryProvider.getFactory());
%>

<!-- product Options for Category -->

<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());

List<Category> list = cdao.getCategories();
		
		//getting count of products and users
		Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>

	<%@include file="components/navbar.jsp"%>
	<div class="container admin">

		<div class="container-fluid mt-2">
			<%@include file="components/message.jsp"%>
		</div>

		<div class="row mt-3">

			<!-- first column -->
			<div class="col-md-4">

				<!-- first box -->
				<div class="card">
					<div class="card-body text-centre">

						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="users_icon" src="img/users1.png">
						</div>

						<h1><%=m.get("userCount")%></h1>

						<h1 class="text-uppercase text-muted">Users</h1>

					</div>
				</div>
			</div>

			<!-- second column -->
			<div class="col-md-4">

				<!-- second box -->

				<div class="card text-centre">
					<div class="card-body">
						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="_icon" src="img/categories1.png">
						</div>

						<h1><%=list.size()%></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>

			</div>

			<!-- third column -->
			<div class="col-md-4">

				<!-- third box -->

				<div class="card">
					<div class="card-body text-centre">

						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="users_icon" src="img/products.png">
						</div>

						<h1><%=m.get("productCount") %></h1>

						<h1 class="text-uppercase text-muted">Products</h1>

					</div>
				</div>
			</div>


		</div>

		<!-- second row -->
		<div class="row mt-3">
			<!-- second:first column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-centre">

						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="users_icon" src="img/addcategory.png">
						</div>

						<p class="mt-1">click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>

					</div>
				</div>

			</div>

			<!-- second:second column -->
			<div class="col-md-6">

				<div class=card data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-centre">

						<div class="container">

							<img style="max-width: 125px" class="img-fluid rounded-circle"
								alt="users_icon" src="img/addpoduct.png">
						</div>
						<p class="mt-1">click here to add new product</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>

					</div>
				</div>

			</div>
		</div>

	</div>
	<!--add  category modal -->




	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addCategory">

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Title" required="required">
						</div>

						<div class="form-group">
							<textarea style="height: 300px" class="form-control"
								name="catDescription" placeholder="Enter Category Description"></textarea>

						</div>

						<div class="container text-center">

							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>

						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!--end category modal -->


	<!--add  product modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addProduct" />

						<!-- product title -->

						<div class="form-group">
							<input type="text" class="form-control" name="pTitle"
								placeholder="Enter Product Title" required="required">
						</div>
						<!-- product Description -->

						<div class="form-group">
							<textarea style="height: 200px" class="form-control"
								name="pDescription" placeholder="Enter Product Description"></textarea>
						</div>
						<!-- product price -->


						<div class="form-group">
							<input type="number" class="form-control" name="pPrice"
								placeholder="Enter Product price" required="required">
						</div>

						<!-- product Discount-->

						<div class="form-group">
							<input type="number" class="form-control" name="pDiscount"
								placeholder="Enter product Discount">
						</div>

						<!-- product Quantity -->

						<div class="form-group">
							<input type="number" class="form-control" name="pQuantity"
								placeholder="Enter product Quantity" required="required">
						</div>




						<div class="form-group">
							<select name="catId" class="form-control" id="">
								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>">
									<%=c.getCategoryTitle()%></option>
								<%
								}
								%>
							</select>
						</div>

						<!-- product photos -->

						<div class="form-group">
							<label for="pPic">Select picture of product</label> <input
								type="file" id="pPic" class="form-control" name="pPhotos"
								placeholder="Enter Product price" required="required">
						</div>



						<div class="container text-center">

							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-outline-warning"
								data-dismiss="modal">Close</button>

						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

	<!--end product modal -->


</body>
</html>