<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Avatar</title>

<link rel="stylesheet"
	href="Template/Backend/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="Template/Backend/assets/font-awesome/4.5.0/css/font-awesome.min.css" />

<link rel="stylesheet"
	href="Template/Backend/assets/css/dropzone.min.css" />

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
		<div class="navbar-container ace-save-state" id="navbar-container">
			<jsp:include page="HeaderAdmin.jsp" />
		</div>
		<!-- /.navbar-container -->
	</div>

	<div class="main-container ace-save-state" id="main-container">
		<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
		<jsp:include page="Menu.jsp" />

		<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
						</li>

						<li><a href="#">Category</a></li>
						<li class="active">Products</li>
					</ul>
					<!-- /.breadcrumb -->


				</div>

				<div class="page-content">


					<div class="page-header">
						<h1>
							Dropzone.js <small> <i
								class="ace-icon fa fa-angle-double-right"></i> Drag &amp; drop
								file upload with image preview
							</small>
						</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<div class="alert alert-info">
								<i class="ace-icon fa fa-hand-o-right"></i> Please note that
								demo server is not configured to save uploaded files, therefore
								you may get an error message.

							</div>
							<form action="UploadAvatarProducts?productId=${productId}"
								method="post" enctype="multipart/form-data">
								<label class="block clearfix"> <%=request.getAttribute("msgAvatar")!=null?request.getAttribute("msgAvatar"):" "%>
								</label>

								<table id="fileTable">
									<tr>
										<td><input name="files" type="file" /></td>
									</tr>

								</table>




								<div class="space"></div>

								<div class="clearfix">


									<input type="submit" value="Submit"
										class="btn btn-sm btn-primary">


								</div>

								<div class="space-4"></div>
							</form>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<jsp:include page="FooterAdmin.jsp" />

		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->
	<script src="Template/Backend/assets/js/jquery-2.1.4.min.js"></script>



	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='Template/Backend/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="Template/Backend/assets/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->
	<script src="Template/Backend/assets/js/dropzone.min.js"></script>

	<!-- ace scripts -->
	<script src="Template/Backend/assets/js/ace-elements.min.js"></script>
	<script src="Template/Backend/assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
</body>
</html>