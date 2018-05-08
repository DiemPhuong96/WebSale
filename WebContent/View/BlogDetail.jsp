<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blog detail</title>
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
<style type="text/css">
/* CSS Test begin */
.comment-box {
	margin-top: 30px !important;
}
/* CSS Test end */
.comment-box img {
	width: 50px;
	height: 50px;
}

.comment-box .media-left {
	padding-right: 10px;
	width: 65px;
}

.comment-box .media-body p {
	border: 1px solid #ddd;
	padding: 10px;
}

.comment-box .media-body .media p {
	margin-bottom: 0;
}

.comment-box .media-heading {
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	padding: 7px 10px;
	position: relative;
	margin-bottom: -1px;
}

.comment-box .media-heading:before {
	content: "";
	width: 12px;
	height: 12px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	border-width: 1px 0 0 1px;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
	position: absolute;
	top: 10px;
	left: -6px;
}
</style>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function(){
		var blogId = ${blog.blogId}
		$.ajax({
            url : "Comment",
            type : "post",
            dataType:"html",
            data : {
            	name: '0',
            	content: '0',
            	email: '0',
            	blogId: blogId
            },
            success : function (data){
                $('#commentblog').html(data);
            }
        });
		
		$('#submit').click(function(){
			var name = $('#name').val();
			var content = $('#content').val();
			var email = $('#email').val();
			var blogId = ${blog.blogId}
		
			$.ajax({
                url : "Comment",
                type : "post",
                dataType:"html",
                data : {
                	name: name,
                	content: content,
                	email: email,
                	blogId: blogId
                },
                success : function (data){
                    $('#commentblog').html(data);
                }
            });
		})
	})	
			
</script>
</head>
<body class="animsition">
	<!-- Header -->
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

	<!-- content page -->
	<section class="bgwhite p-t-60 p-b-25">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-50 p-r-0-lg">
					<div class="p-b-40">
						<div class="blog-detail-img wrap-pic-w">
							<img src="ImageUpload/${blog.image}" alt="IMG-BLOG">
						</div>

						<div class="blog-detail-txt p-t-33">
							<h4 class="p-b-11 m-text24">${blog.name}</h4>

							<div class="s-text8 flex-w flex-m p-b-21">
								<span> By Admin <span class="m-l-3 m-r-6">|</span>
								</span> <span> 28 Dec, 2018 <span class="m-l-3 m-r-6">|</span>
								</span> <span> Cooking, Food <span class="m-l-3 m-r-6">|</span>
								</span> <span> 8 Comments </span>
							</div>

							<p class="p-b-25">${blog.content}</p>


						</div>


					</div>
					<div id="commentblog"></div>
					<div id="comment">
						<div class='container'>
							<div class="media comment-box"></div>
							<br> <br>
						</div>
						<!-- Leave a comment -->

						<h4 class="m-text25 p-b-14">Leave a Comment</h4>

						<p class="s-text8 p-b-40">Your email address will not be
							published. Required fields are marked *</p>

						<textarea
							class="dis-block s-text7 size18 bo12 p-l-18 p-r-18 p-t-13 m-b-20"
							id="content" name="comment" placeholder="Comment..."></textarea>

						<div class="bo12 of-hidden size19 m-b-20">
							<input class="sizefull s-text7 p-l-18 p-r-18" type="text"
								name="name" id="name" placeholder="Name *">
						</div>

						<div class="bo12 of-hidden size19 m-b-20">
							<input class="sizefull s-text7 p-l-18 p-r-18" type="text"
								name="email" id="email" placeholder="Email *">
						</div>

						<div class="w-size24">
							<!-- Button -->
							<button
								class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4"
								id="submit">Post Comment</button>
						</div>

					</div>
				</div>


			</div>
			<jsp:include page="SidebarRightBlog.jsp" />
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