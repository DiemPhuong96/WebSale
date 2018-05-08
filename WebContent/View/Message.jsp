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
<script type="text/javascript">
			function validate(){
				var email = document.myform.email.value;
				var phone = document.myform.phone.value;
				var name = document.myform.name.value;
				var content = document.myform.content.value;
				
				
				if(email == ""|| phone=="" || name == "" || content==""){
					alert("must not be empty");
					return false;
				}
				
				
			}
			
		
			
		</script>
</head>
<body class="animsition">
	<!-- Header -->
	<jsp:include page="Header.jsp" />

	<!-- Title Page -->
	<section class="bg-title-page p-t-40 p-b-50 flex-col-c-m"
		style="background-image: url(ImageUpload/logoblog.jpeg);">
	<h2 class="l-text2 t-center">Contact</h2>
	</section>


	<!-- content page -->
	<section class="bgwhite p-t-66 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-6 p-b-30">
				<div class="p-r-20 p-r-0-lg">
					<div class="contact-map size21" id="google_map">
						<iframe
							src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.284062951655!2d108.2381958144656!3d16.050742488892322!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421762d3597d37%3A0x70afb5e7dbdbe4a!2zMTA0IENow6J1IFRo4buLIFbEqW5oIFThur8sIE3hu7kgQW4sIE5nxakgSMOgbmggU8ahbiwgxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1525274474578"
							width="600" height="450" frameborder="0" style="border: 0"
							allowfullscreen></iframe>
					</div>
				</div>
			</div>

			<div class="col-md-6 p-b-30" style="padding-left: 30px">
				<form name="myform" action="MessageForward" class="leave-comment"
					method="post" onsubmit="return validate()">
					<h4 class="m-text26 p-b-36 p-t-15">Send us your message</h4>

					<h6 class="m-text26 p-b-36 p-t-15"
						style="color: red; font-size: 24">${message}</h6>

					<div class="bo4 of-hidden size15 m-b-20">
						<input class="sizefull s-text7 p-l-22 p-r-22" type="text"
							name="name" placeholder="Full Name">
					</div>

					<div class="bo4 of-hidden size15 m-b-20">
						<input class="sizefull s-text7 p-l-22 p-r-22" type="text"
							name="phone" placeholder="Phone Number">
					</div>

					<div class="bo4 of-hidden size15 m-b-20">
						<input class="sizefull s-text7 p-l-22 p-r-22" type="text"
							name="email" placeholder="Email Address">
					</div>

					<textarea
						class="dis-block s-text7 size20 bo4 p-l-22 p-r-22 p-t-13 m-b-20"
						name="content" placeholder="Message"></textarea>

					<div class="w-size25">
						<!-- Button -->
						<button
							class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
							Send</button>
					</div>
				</form>
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