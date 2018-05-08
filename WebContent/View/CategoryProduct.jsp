<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CategoryPage</title>
<link rel="icon" type="image/png"
	href="Template/FrontEnd/images/icons/favicon.png" />

<link rel="icon" type="image/png"
	href="Template/FrontEnd/images/icons/favicon.png" />

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/themify/themify-icons.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/fonts/elegant-font/html-css/style.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/animate/animate.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/css-hamburgers/hamburgers.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/animsition/css/animsition.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/select2/select2.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/slick/slick.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/vendor/noui/nouislider.min.css">

<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/util.css">
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/main.css">
<script>
		$(document).ready(function(){
			var numberpage = ${numberpage};
		
			$.ajax({
                url : "ShopResult",
                type : "post",
                dataType:"html",
                data : {
                	pageid: numberpage,
                },
                success : function (data){
                    $('#product').html(data);
                }
            });
		
		
				$('#sorting1').change(function(){
					var sort = $('#sorting1 option:selected');
					var sortByPrice = $('#sortByPrice option:selected');
				
				$.ajax({
			                url : "SortingShop",
			                type : "post",
			                dataType:"html",
			                data : {
			                	value1:  sort.val(),
			                	value2: sortByPrice.val()
			                },
			                success : function (data){
			                    $('#product').html(data);
			                }
			            });
				
				
					});
				
				$('#sortByPrice').change(function(){
					var sort = $('#sorting1 option:selected');
					var sortByPrice = $('#sortByPrice option:selected');
				
				$.ajax({
			                url : "SortingShop",
			                type : "post",
			                dataType:"html",
			                data : {
			                	value1:  sort.val(),
			                	value2: sortByPrice.val()
			                },
			                success : function (data){
			                    $('#product').html(data);
			                }
			            });
					
					});
					
			
		
			
			
			
			$('#search-product').keyup(function(){
				var name = $('#search-product').val();
				if(name != ''){
					  $.ajax({
		                    url : "SearchResult",
		                    type : "post",
		                    dataType:"html",
		                    data : {
		                         name : name,
		 
		                    },
		                    success : function (data){
		                        $('#product').html(data);
		                    }
		                });
				}
				else{
					$.ajax({
		                url : "ShopResult",
		                type : "post",
		                dataType:"html",
		                data : {
		                	pageid: numberpage,
		                	value: value
		                },
		                success : function (data){
		                    $('#product').html(data);
		                }
		            });
					
				}
		              
		       //  alert(name);   
			})
	
		})
	
</script>
</head>
<body class="animsition">
	<!-- Header -->
	<!-- header -->
	<jsp:include page="Header.jsp" />
	<!-- content -->
	<!-- Slide1 -->
	<jsp:include page="SlideTop.jsp" />

	<!-- Content page -->
	<section class="bgwhite p-t-55 p-b-65">
	<div class="container">
		<div class="row">
			<jsp:include page="SidebarLeft.jsp" />

			<div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
				<!--  -->
				<jsp:include page="SortingBar.jsp" />


				<!-- Product -->



			</div>
		</div>
	</section>


	<!-- Footer -->

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
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/daterangepicker/moment.min.js"></script>
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/slick/slick.min.js"></script>
	<script type="text/javascript"
		src="Template/FrontEnd/js/slick-custom.js"></script>
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
	<script type="text/javascript"
		src="Template/FrontEnd/vendor/noui/nouislider.min.js"></script>
	<script type="text/javascript">
		/*[ No ui ]
	    ===========================================================*/
	    var filterBar = document.getElementById('filter-bar');

	    noUiSlider.create(filterBar, {
	        start: [ 50, 200 ],
	        connect: true,
	        range: {
	            'min': 50,
	            'max': 200
	        }
	    });

	    var skipValues = [
	    document.getElementById('value-lower'),
	    document.getElementById('value-upper')
	    ];

	    filterBar.noUiSlider.on('update', function( values, handle ) {
	        skipValues[handle].innerHTML = Math.round(values[handle]) ;
	    });
	</script>
	<!--===============================================================================================-->
	<script src="Template/FrontEnd/js/main.js"></script>
</body>
</html>