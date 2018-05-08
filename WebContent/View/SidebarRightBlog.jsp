<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div class="col-md-4 col-lg-3 p-b-80">
		<div class="rightbar">
			<!-- Search -->
			<div class="pos-relative bo11 of-hidden">
				<form action="SearchBlog" method="post">
					<input class="s-text7 size16 p-l-23 p-r-50" type="text"
						id="search-blog" name="name" placeholder="Search">

					<button class="flex-c-m size5 ab-r-m color1 color0-hov trans-0-4"
						id="search">
						<i class="fs-13 fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
			</div>

			<!-- Categories -->
			<h4 class="m-text23 p-t-56 p-b-34">Categories</h4>

			<ul>
				<c:forEach items="${listCategoryforblog}" var="list">
					<li class="p-t-6 p-b-8 bo6"><a href="#"
						class="s-text13 p-t-5 p-b-5"> ${list.name} </a></li>


				</c:forEach>
			</ul>

			<!-- Featured Products -->
			<h4 class="m-text23 p-t-65 p-b-34">Featured Products</h4>

			<ul class="bgwhite">
				<c:forEach items="${listProduct}" var="list">
					<li class="flex-w p-b-20"><a href="product-detail.html"
						class="dis-block wrap-pic-w w-size22 m-r-20 trans-0-4 hov4"> <img
							src="ImageUpload/${list.avartar}" alt="IMG-PRODUCT">
					</a>

						<div class="w-size23 p-t-5">
							<a href="DetailProduct?productId=${list.productId}"
								class="s-text20"> ${list.productName} </a> <span
								class="dis-block s-text17 p-t-6"> ${list.price} </span>
						</div></li>
				</c:forEach>

			</ul>


		</div>
	</div>
</body>
</html>