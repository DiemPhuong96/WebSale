<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="Template/FrontEnd/images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/themify/themify-icons.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/elegant-font/html-css/style.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/util.css">
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">
	<jsp:include page="Header.jsp" />

	<!-- breadcrumb -->
	<div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
		<a href="index.html" class="s-text16"> Home <i
			class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a> <a href="blog.html" class="s-text16"> Blog <i
			class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
		</a> <span class="s-text17"> Black Friday Guide: Best Sales &
			Discount Codes </span>
	</div>
	<section class="bgwhite p-t-60">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-75">
				<div class="p-r-50 p-r-0-lg">
					<c:if test="${msg == null}">
						<!-- item blog -->
						<c:forEach items="${listBlog}" var="list">
							<div class="item-blog p-b-80">
								<a href="blog-detail.html"
									class="item-blog-img pos-relative dis-block hov-img-zoom">
									<img src="ImageUpload/${list.image}" alt="IMG-BLOG"> <span
									class="item-blog-date dis-block flex-c-m pos1 size17 bg4 s-text1">
										28 Dec, 2018 </span>
								</a>

								<div class="item-blog-txt p-t-33">
									<h4 class="p-b-11">
										<a href="DetailBlog?blogid=${list.blogId}" class="m-text24">
											${list.name} </a>
									</h4>

									<div class="s-text8 flex-w flex-m p-b-21">
										<span> By Admin <span class="m-l-3 m-r-6">|</span>
										</span> <span> Cooking, Food <span class="m-l-3 m-r-6">|</span>
										</span> <span> 8 Comments </span>
									</div>

									<p class="p-b-12">${list.meta}</p>

									<a href="DetailBlog?blogid=${list.blogId}" class="s-text20">
										Continue Reading <i class="fa fa-long-arrow-right m-l-8"
										aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${msg != null }">
						<center>
							<h4 style="color: red">${msg}</h4>
						</center>
					</c:if>


				</div>


			</div>
			<jsp:include page="SidebarRightBlog.jsp" />
		</div>
	</div>
	</section>


	<jsp:include page="Footer.jsp" />



	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection -->
	<div id="dropDownSelect1"></div>
	<div id="dropDownSelect2"></div>



	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/bootstrap/js/popper.js"></script>
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/select2/select2.min.js"></script>
	<script type="text/javascript">
		$(".selection-1").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});

		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect2')
		});
	</script>
	<!--===============================================================================================-->
	<script src="Template/FrontEnd/js/main.js"></script>
</body>
</html>