<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit slide</title>
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
						<li><a href="SlideTopForward">Edit theme</a></li>
						<li class="active">Slide top</li>
					</ul>
					<!-- /.breadcrumb -->


				</div>
				<div class="page-content">


					<div class="row">
						<div class="col-xs-12">
							<div>


								<div class="row">
									<div class="col-xs-12">
										<table id="simple-table"
											class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">Serial</th>
													<th class="center">Image</th>
													<th class="center">Slogan1</th>
													<th class="center">Slogan2</th>
													<th class="center">Change</th>
													<th class="center">Delete</th>

												</tr>
											</thead>
											<tbody>

												<c:forEach items="${listSlidetop}" var="list">
													<tr>
														<td class="center">${list.slideTopId}</td>
														<td class="center">${list.image}</td>
														<td class="center">${list.slogan1}</td>
														<td class="center">${list.slogan2}</td>
														<td class="center"><a class="green"
															href="ChangeSlideTopForward?slideTopId=${list.slideTopId}">
																<i class="ace-icon fa fa-pencil bigger-130"></i>
														</a></td>
														<td class="center"><a class="red"
															href="DeleteSlideTopForward?slideTopId=${list.slideTopId}">
																<i class="ace-icon fa fa-trash-o bigger-130"></i>
														</a></td>


													</tr>
												</c:forEach>

											</tbody>

										</table>
									</div>
								</div>
								<div class="row">

									<div class="col-xs-12">
										<button type="button" class="btn btn-white btn-info btn-bold"
											data-toggle="modal" data-target="#myModal">
											<i class="ace-icon fa fa-pencil align-top bigger-125"></i>
											New Banner
										</button>

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
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<form action="InsertSloganSlideTopForword" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Insert Slogan</h4>
					</div>
					<div class="modal-body">

						<div class="form-group"
							style="padding-bottom: 30px; padding-left: 100px;">
							<div class="col-sm-9">
								<input type="text" id="form-field-1-1"
									placeholder="Insert Slogan 1" class="form-control"
									name="slogan1" />
							</div>
							<br> <br>
							<div class="col-sm-9">
								<input type="text" id="form-field-1-1"
									placeholder="Insert Slogan2" class="form-control"
									name="slogan2" />
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-info" type="submit">
							<i class="ace-icon fa fa-check bigger-110"></i> Insert
						</button>
					</div>
				</div>
			</form>
		</div>
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