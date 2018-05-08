<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About page</title>
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
	<!-- Header -->
	<jsp:include page="Header.jsp" />

	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m"
		style="background-image: url(ImageUpload/logoblog.jpeg);">
	<h2 class="l-text2 t-center">About</h2>
	</section>

	<!-- content page -->
	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-38">
	<div class="container">
		<div class="row">
			<div class="col-md-4 p-b-30">
				<div class="hov-img-zoom">
					<img src="ImageUpload/${about.image}" alt="IMG-ABOUT" height="450">
				</div>
			</div>

			<div class="col-md-8 p-b-30">
				<h3 class="m-text26 p-t-15 p-b-16">${about.name}</h3>

				<p class="p-b-28">${about.content}</p>


			</div>
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
	<script src="Template/FrontEnd/js/main.js"></script>

</body>
</html>