<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add products</title>
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
<script type="text/javascript">
		function insertPrice(){
			var xhttp;
			var price = document.insert.price.value;
			document.getElementById("price").innerHTML = price + " $";
		}
		
		function insertDiscount(){
			var xhttp;
			var discount = document.insert.discount.value;
			document.getElementById("discount").innerHTML = discount + " %";
		}
		
		function validate1(){
			var name = document.insert.name.value;
			var discount = document.insert.discount.value;
			var price = document.insert.price.value;
			var productCategory = document.insert.productCategory.value;
			var size = document.insert.size.value;
			var color = document.insert.color.value;
			var description = document.insert.description.value;
			if((name =='')||(discount='')||(price=="")||(productCategory =="")||(size=="")||(color=="")||(description=="")){
				document.getElementById("validate").innerHTML = "must not be empty"
				return false;
			}
			else{
				return true;
			}
		}
		</script>
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

				</div>
				<div class="page-content">


					<div class="row">
						<div class="col-xs-12">
							<div>
								<form class="form-horizontal"
									action="ProductsForward?categoryId=${categoryId}" method="post"
									name="insert" role="form" onsubmit="return validate1()">
									<div class="form-group">
										<br>
										<center>
											<div id="validate" style="color: red"></div>
										</center>
										<br> <br> <label
											class="col-sm-3 control-label no-padding-right"
											for="form-field-1"> Category </label>
										<div class="col-sm-9">
											<select multiple="" class="chosen-select form-control"
												id="form-field-select-4"
												data-placeholder="Choose a State..." style="width: 350px"
												name="productCategory">
												<c:forEach items="${listprocare}" var="list">
													<option value="${list.productCategoryId}">${list.name}</option>
												</c:forEach>

											</select> <br> <br>
										</div>


										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1"> Name</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" placeholder="Name"
												class="col-xs-10 col-sm-5" name="name" /> <br> <br>
										</div>
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1"> Price </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" placeholder="Price"
												class="col-xs-10 col-sm-5" name="price"
												onkeyup="insertPrice()" /> <br> <br>
											<div id="price" style="color: red"></div>
										</div>

										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1"> Discount </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1"
												placeholder="Discount % " class="col-xs-10 col-sm-5"
												name="discount" onkeyup="insertDiscount()" /> <br> <br>
											<div id="discount" style="color: red"></div>
										</div>

										<c:if test="${categoryId != 2}">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1"> Size </label>
											<div class="col-sm-9">
												<select class="chosen-select form-control"
													id="form-field-select-3"
													data-placeholder="Choose a State..." style="width: 350px"
													name="size">
													<option value="AL"></option>
													<c:forEach items="${listSize}" var="list">
														<option value="${list.sizeId}">${list.name}</option>

													</c:forEach>

												</select> <br>
											</div>
										</c:if>
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">Color</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" placeholder="Color "
												class="col-xs-10 col-sm-5" name="color" /> <br> <br>
										</div>
										<label class="col-sm-3 control-label no-padding-right"
											for="form-field-1">Description</label>
										<div class="col-sm-9">


											<textarea class="form-control" id="form-field-8"
												placeholder="Description" style="width: 350px"
												name="description"></textarea>
										</div>
									</div>
									<center>
										<button type="submit" class="btn btn-white btn-info btn-bold">
											<i class="ace-icon fa fa-pencil align-top bigger-125"></i>
											Add Image
										</button>
									</center>
								</form>
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









	<script src="Template/Backend/assets/js/jquery-2.1.4.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
	<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
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