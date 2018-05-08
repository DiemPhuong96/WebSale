<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
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
						<li><a href="ProductsForward?pageid=1">Products &
								Category</a></li>
						<li class="active">Products</li>
					</ul>
					<!-- /.breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- /.nav-search -->
				</div>
				<div class="page-content">


					<div class="row">
						<div class="col-xs-12">
							<div>

								<button type="button" class="btn btn-white btn-info btn-bold"
									data-toggle="modal" data-target="#myModal">
									<i class="ace-icon fa fa-pencil align-top bigger-125"></i> Add
								</button>

								<br> <br>
								<div class="row">
									<div class="col-xs-12">
										<table id="simple-table"
											class="table  table-bordered table-hover">
											<thead>
												<tr>
													<th class="center">Serial</th>
													<th class="center">Products name</th>

													<th class="center">Price</th>
													<th class="center">Discount</th>

													<th class="center">Delete</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${listProducts}" var="list">
													<tr>
														<td class="center">${list.productId}</td>
														<td class="center">${list.productName}</td>

														<td class="center">${list.price}</td>
														<td class="center">${list.discount}</td>

														<td class="center"><a class="red"
															href="DeleteProduct?productId=${list.productId}"> <i
																class="ace-icon fa fa-trash-o bigger-130"></i>
														</a></td>


													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
								</div>
								<center>
									<div class="row">
										<div class="col-xs-12">
											<div class="row">
												<div>
													<ul class="pagination">

														<c:if test="${numberpage == 1}">
															<li class="active"><a href="#">Prev</a></li>

															<li><a href="ProductsForward?pageid=${numberpage+1}">Next</a></li>
														</c:if>
														<c:if test="${numberpage >1 && numberpage <maxpageid}">
															<li><a href="ProductsForward?pageid=${numberpage-1}">Prev</a></li>

															<li><a href="ProductsForward?pageid=${numberpage+1}">Next</a></li>
														</c:if>

														<c:if test="${numberpage == maxpageid}">
															<li><a href="ProductsForward?pageid=${numberpage-1}">Prev</a></li>

															<li class="active"><a href="#">Next</a></li>
														</c:if>




													</ul>
												</div>

											</div>
										</div>

									</div>
								</center>
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


		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<form action="ProductsCategoryController?pageid=1" method="post">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">choose category for products</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="widget-body">
								<div class="widget-main">
									<div>
										<label for="form-field-select-3">Category</label> <br /> <select
											class="chosen-select form-control" name="dropCategory"
											id="form-field-select-3" data-placeholder="Choose a State...">
											<option value=""></option>
											<c:forEach items="${listCate}" var="list">
												<option value="${list.categoryId}">${list.name}</option>

											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-white btn-info btn-bold">
							<i class="ace-icon fa fa-pencil align-top bigger-125"></i> Add
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>





	<script src="Template/Backend/assets/js/jquery-2.1.4.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='Template/Backend/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
	<script src="Template/Backend/assets/js/bootstrap.min.js"></script>

	<!-- page specific plugin scripts -->
	<script src="Template/Backend/assets/js/jquery.dataTables.min.js"></script>
	<script
		src="Template/Backend/assets/js/jquery.dataTables.bootstrap.min.js"></script>
	<script src="Template/Backend/assets/js/dataTables.buttons.min.js"></script>
	<script src="Template/Backend/assets/js/buttons.flash.min.js"></script>
	<script src="Template/Backend/assets/js/buttons.html5.min.js"></script>
	<script src="Template/Backend/assets/js/buttons.print.min.js"></script>
	<script src="Template/Backend/assets/js/buttons.colVis.min.js"></script>
	<script src="Template/Backend/assets/js/dataTables.select.min.js"></script>

	<!-- ace scripts -->
	<script src="Template/Backend/assets/js/ace-elements.min.js"></script>
	<script src="Template/Backend/assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->
	<script type="text/javascript">
			jQuery(function($) {
				//initiate dataTables plugin
				var myTable = 
				$('#dynamic-table')
				//.wrap("<div class='dataTables_borderWrap' />")   //if you are applying horizontal scrolling (sScrollX)
				.DataTable( {
					bAutoWidth: false,
					"aoColumns": [
					  { "bSortable": false },
					  null, null,null, null, null,
					  { "bSortable": false }
					],
					"aaSorting": [],
					
					
				
			
					select: {
						style: 'multi'
					}
			    } );
			
				
				
				$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';
				
				new $.fn.dataTable.Buttons( myTable, {
					buttons: [
					  {
						"extend": "colvis",
						"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>Show/hide columns</span>",
						"className": "btn btn-white btn-primary btn-bold",
						columns: ':not(:first):not(:last)'
					  },
					  {
						"extend": "copy",
						"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>Copy to clipboard</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "csv",
						"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "excel",
						"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "pdf",
						"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
						"className": "btn btn-white btn-primary btn-bold"
					  },
					  {
						"extend": "print",
						"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>Print</span>",
						"className": "btn btn-white btn-primary btn-bold",
						autoPrint: false,
						message: 'This print was produced using the Print button for DataTables'
					  }		  
					]
				} );
				myTable.buttons().container().appendTo( $('.tableTools-container') );
				
				//style the message box
				var defaultCopyAction = myTable.button(1).action();
				myTable.button(1).action(function (e, dt, button, config) {
					defaultCopyAction(e, dt, button, config);
					$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
				});
				
				
				var defaultColvisAction = myTable.button(0).action();
				myTable.button(0).action(function (e, dt, button, config) {
					
					defaultColvisAction(e, dt, button, config);
					
					
					if($('.dt-button-collection > .dropdown-menu').length == 0) {
						$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
					}
					$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
				});
			
				////
			
				setTimeout(function() {
					$($('.tableTools-container')).find('a.dt-button').each(function() {
						var div = $(this).find(' > div').first();
						if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text()});
						else $(this).tooltip({container: 'body', title: $(this).text()});
					});
				}, 500);
				
				
				
				
				
				myTable.on( 'select', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
					}
				} );
				myTable.on( 'deselect', function ( e, dt, type, index ) {
					if ( type === 'row' ) {
						$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
					}
				} );
			
			
			
			
				/////////////////////////////////
				//table checkboxes
				$('th input[type=checkbox], td input[type=checkbox]').prop('checked', false);
				
				//select/deselect all rows according to table header checkbox
				$('#dynamic-table > thead > tr > th input[type=checkbox], #dynamic-table_wrapper input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$('#dynamic-table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) myTable.row(row).select();
						else  myTable.row(row).deselect();
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#dynamic-table').on('click', 'td input[type=checkbox]' , function(){
					var row = $(this).closest('tr').get(0);
					if(this.checked) myTable.row(row).deselect();
					else myTable.row(row).select();
				});
			
			
			
				$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
					e.stopImmediatePropagation();
					e.stopPropagation();
					e.preventDefault();
				});
				
				
				
				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if($row.is('.detail-row ')) return;
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
				
				
				
				/***************/
				$('.show-details-btn').on('click', function(e) {
					e.preventDefault();
					$(this).closest('tr').next().toggleClass('open');
					$(this).find(ace.vars['.icon']).toggleClass('fa-angle-double-down').toggleClass('fa-angle-double-up');
				});
				/***************/
				
			
			
			})
		</script>

</body>
</html>