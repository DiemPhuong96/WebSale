<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Banner</title>
<link rel="stylesheet"
	href="Template/Backend/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="Template/Backend/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<link rel="stylesheet"
	href="Template/Backend/assets/css/colorbox.min.css" />

<!-- text fonts -->
<link rel="stylesheet"
	href="Template/Backend/assets/css/fonts.googleapis.com.css" />


<link rel="stylesheet" href="Template/Backend/assets/css/ace.min.css"
	class="ace-main-stylesheet" id="main-ace-style" />


<link rel="stylesheet"
	href="Template/Backend/assets/css/ace-skins.min.css" />
<link rel="stylesheet"
	href="Template/Backend/assets/css/ace-rtl.min.css" />


<script src="Template/Backend/assets/js/ace-extra.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/util.css">
<link rel="stylesheet" type="text/css"
	href="Template/FrontEnd/css/main.css">
<!--===============================================================================================-->
</head>
<body class="no-skin">

	<div id="navbar" class="navbar navbar-default          ace-save-state">
		<!-- Header-->
		<jsp:include page="HeaderAdmin.jsp" />

		<!-- end header -->

	</div>
	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
		<!-- sidebar -->
		<jsp:include page="Menu.jsp" />
		<!-- end sidebar -->
		<!-- begin content -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="AdminForward">Home</a></li>
						<li>Edit theme</li>
						<li class="active">Banner</li>
					</ul>
					<!-- /.breadcrumb -->


				</div>
				<div class="page-content">


					<div class="row">
						<div class="col-xs-12">
							<div>


								<div class="row">
									<div class="col-xs-12">
										<!-- Banner -->
										<div class="banner bgwhite p-t-40 p-b-40">
											<div class="container">
												<div class="row">
													<c:forEach items="${listBanner}" var="list">
														<div class="col-sm-10 col-md-8 col-lg-4 m-l-r-auto">
															<!-- block1 -->
															<div class="block1 hov-img-zoom pos-relative m-b-30">
																<img src="ImageUpload/${list.image}" alt="IMG-BENNER"
																	height=310 width=250>

																<div class="block1-wrapbtn w-size2">
																	<!-- Button -->

																	<a href="ChangeBannerForward?bannerId=${list.bannerId}"
																		class="flex-c-m size2 m-text2 bg3 hov1 trans-0-4">
																		Change </a>
																</div>
															</div>
														</div>
													</c:forEach>

												</div>
											</div>
										</div>


									</div>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end content -->
		<!-- footer -->
		<jsp:include page="FooterAdmin.jsp" />
		<!-- end footer -->
	</div>

	<script src="Template/Backend/assets/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="Template/Backend/assets/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->
	<script src="Template/Backend/assets/js/jquery.colorbox.min.js"></script>

	<!-- ace scripts -->
	<script src="Template/Backend/assets/js/ace-elements.min.js"></script>
	<script src="Template/Backend/assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
			jQuery(function($) {
	var $overflow = '';
	var colorbox_params = {
		rel: 'colorbox',
		reposition:true,
		scalePhotos:true,
		scrolling:false,
		previous:'<i class="ace-icon fa fa-arrow-left"></i>',
		next:'<i class="ace-icon fa fa-arrow-right"></i>',
		close:'&times;',
		current:'{current} of {total}',
		maxWidth:'100%',
		maxHeight:'100%',
		onOpen:function(){
			$overflow = document.body.style.overflow;
			document.body.style.overflow = 'hidden';
		},
		onClosed:function(){
			document.body.style.overflow = $overflow;
		},
		onComplete:function(){
			$.colorbox.resize();
		}
	};

	$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
	$("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange fa-spin'></i>");//let's add a custom loading icon
	
	
	$(document).one('ajaxloadstart.page', function(e) {
		$('#colorbox, #cboxOverlay').remove();
   });
})
		</script>

</body>
</html>