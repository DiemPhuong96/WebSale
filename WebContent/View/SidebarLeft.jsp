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
	<div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
		<div class="leftbar p-r-20 p-r-0-sm">
			<!--  -->
			<div class="search-product pos-relative bo4 of-hidden">
				<input class="s-text7 size6 p-l-23 p-r-50" type="text"
					id="search-product" name="search-product"
					placeholder="Search Products...">

				<button class="flex-c-m size5 ab-r-m color2 color0-hov trans-0-4">
					<i class="fs-12 fa fa-search" aria-hidden="true"></i>
				</button>
			</div>
			<br> <br>
			<h4 class="m-text14 p-b-7">Categories</h4>

			<ul class="p-b-54">
				<li class="p-t-4"><a href="ShopForward?pageid=1"
					class="s-text13 active1"> All </a></li>
				<c:forEach items="${listCategory}" var="list">
					<li class="p-t-4"><a class="cate" href="${list.categoryId}"
						class="s-text13"> ${list.name} </a></li>
				</c:forEach>
			</ul>



		</div>
	</div>
</body>
</html>