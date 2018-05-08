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
	<section class="slide1">
	<div class="wrap-slick1">
		<div class="slick1">
			<c:forEach items="${slideTop}" var="list">
				<div class="item-slick1 item1-slick1"
					style="background-image: url(ImageUpload/${list.image});">
					<div
						class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<h2
							class="caption1-slide1 xl-text2 t-center bo14 p-b-6 animated visible-false m-b-22"
							data-appear="fadeInUp">${list.slogan1}</h2>

						<span
							class="caption2-slide1 m-text1 t-center animated visible-false m-b-33"
							data-appear="fadeInDown"> ${list.slogan2} </span>

						<div class="wrap-btn-slide1 w-size1 animated visible-false"
							data-appear="zoomIn">
							<!-- Button -->
							<a href="product.html"
								class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">
								Shop Now </a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>
</body>
</html>