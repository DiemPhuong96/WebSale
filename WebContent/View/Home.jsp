<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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
	href="Template/FrontEnd/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/util.css">
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	<!-- header -->
	<jsp:include page="Header.jsp" />
	<!-- content -->
	<!-- Slide1 -->
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
							<a href="ShopForward?pageid=1"
								class="flex-c-m size2 bo-rad-23 s-text2 bgwhite hov1 trans-0-4">
								Shop Now </a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>

	<!-- Banner -->

	<div class="banner bgwhite p-t-40 p-b-40">
		<div class="container">
			<div class="row">
				<c:forEach items="${listBanner}" var="list">
					<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
						<!-- block1 -->
						<div class="block1 hov-img-zoom pos-relative m-b-30">
							<img src="ImageUpload/${list.image}" alt="IMG-BENNER" height=330
								width=250>

							<div class="block1-wrapbtn w-size2">
								<!-- Button -->
								<a href="ProductCateForward?cate=${list.bannerId}"
									class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
									${list.name} </a>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</div>


	<!-- New Product -->
	<section class="newproduct bgwhite p-t-45 p-b-105">
	<div class="container">
		<div class="sec-title p-b-60">
			<h3 class="m-text5 t-center">Featured Products</h3>
		</div>

		<!-- Slide2 -->
		<div class="wrap-slick2">
			<div class="slick2">
				<c:forEach items="${listProduct}" var="list">
					<c:if test="${list.discount == 0}">
						<div class="item-slick2 p-l-15 p-r-15">
							<!-- Block2 -->

							<div class="block2">
								<div
									class="block2-img wrap-pic-w of-hidden pos-relative block2-labelnew">
									<img src="ImageUpload/${list.avartar}" height=300
										alt="IMG-PRODUCT">

									<div class="block2-overlay trans-0-4">
										<a href="#"
											class="block2-btn-addwishlist hov-pointer trans-0-4"> <i
											class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
											<i class="icon-wishlist icon_heart dis-none"
											aria-hidden="true"></i>
										</a>

										<div class="block2-btn-addcart w-size1 trans-0-4">
											<!-- Button -->
											<button
												class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
												Add to Cart</button>
										</div>
									</div>
								</div>

								<div class="block2-txt p-t-20">
									<a href="DetailProduct?productId=${list.productId}"
										class="block2-name dis-block s-text3 p-b-5">
										${list.productName} </a> <span class="block2-price m-text6 p-r-5">
										${list.price}$ </span>
								</div>
							</div>
						</div>
					</c:if>
					<c:if test="${list.discount != 0 }">
						<div class="item-slick2 p-l-15 p-r-15">
							<!-- Block2 -->
							<div class="block2">
								<div
									class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
									<img src="ImageUpload/${list.avartar}" height=300
										alt="IMG-PRODUCT">

									<div class="block2-overlay trans-0-4">
										<a href="#"
											class="block2-btn-addwishlist hov-pointer trans-0-4"> <i
											class="icon-wishlist icon_heart_alt" aria-hidden="true"></i>
											<i class="icon-wishlist icon_heart dis-none"
											aria-hidden="true"></i>
										</a>

										<div class="block2-btn-addcart w-size1 trans-0-4">
											<!-- Button -->
											<button
												class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
												Add to Cart</button>
										</div>
									</div>
								</div>

								<div class="block2-txt p-t-20">
									<a href="DetailProduct?productId=${list.productId}"
										class="block2-name dis-block s-text3 p-b-5">
										${list.productName} </a> <span
										class="block2-oldprice m-text7 p-r-5"> ${list.price} </span> <span
										class="block2-newprice m-text8 p-r-5">
										${list.price*(100 - list.discount)/100}$ </span>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

			</div>
		</div>

	</div>
	</section>

	<c:forEach items="${listVideo}" var="list">
		<section class="parallax0 parallax100"
			style="background-image: url(ImageUpload/${list.image});">
	</c:forEach>
	<div class="overlay0 p-t-190 p-b-200">
		<div class="flex-col-c-m p-l-15 p-r-15">
			<span class="m-text9 p-t-45 fs-20-sm"> The Beauty </span>

			<h3 class="l-text1 fs-35-sm">Lookbook</h3>

			<span class="btn-play s-text4 hov5 cs-pointer p-t-25"
				data-toggle="modal" data-target="#modal-video-01"> <i
				class="fa fa-play" aria-hidden="true"></i> Play Video
			</span>
		</div>
	</div>
	</section>
	<!-- Blog -->
	<section class="blog bgwhite p-t-94 p-b-65">
	<div class="container">
		<div class="sec-title p-b-52">
			<h3 class="m-text5 t-center">Our Blog</h3>
		</div>

		<div class="row">

			<c:forEach items="${listBlog}" var="list">
				<div class="col-sm-10 col-md-4 p-b-30 m-l-r-auto">
					<!-- Block3 -->
					<div class="block3">
						<a href="DetailBlog?blogid=${list.blogId}"
							class="block3-img dis-block hov-img-zoom"> <img
							src="ImageUpload/${list.image}" alt="IMG-BLOG" height="250">
						</a>

						<div class="block3-txt p-t-14">
							<h4 class="p-b-7">
								<a href="DetailBlog?blogid=${list.blogId}" class="m-text11">
									${list.name} </a>
							</h4>



							<p class="s-text8 p-t-16">${list.meta}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>




	<!-- Instagram -->

	<!-- Shipping -->
	<jsp:include page="Footer.jsp" />


	<!-- footer -->
	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>

	<!-- Container Selection1 -->
	<div id="dropDownSelect1"></div>

	<!-- Modal Video 01-->
	<div class="modal fade" id="modal-video-01" tabindex="-1" role="dialog"
		aria-hidden="true">

		<div class="modal-dialog" role="document" data-dismiss="modal">
			<div class="close-mo-video-01 trans-0-4" data-dismiss="modal"
				aria-label="Close">&times;</div>

			<div class="wrap-video-mo-01">
				<div class="w-full wrap-pic-w op-0-0">
					<img src="Template/FrontEnd/images/icons/video-16-9.jpg" alt="IMG">
				</div>
				<div class="video-mo-01">
					<c:forEach items="${listVideo}" var="list">
						<iframe src="${list.video}" allowfullscreen></iframe>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
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
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/slick/slick.min.js"></script>
	<script type="text/javascript"
		src="Template/FrontEnd/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/lightbox2/js/lightbox.min.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript">
		$('.block2-btn-addcart').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});

		$('.block2-btn-addwishlist').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.block2-name').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");
			});
		});
	</script>

	<!--===============================================================================================-->
	<script src="Template/FrontEnd/js/main.js"></script>


</body>
</html>