<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div id="sidebar"
		class="sidebar                  responsive                    ace-save-state">
		<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>
		<div class="sidebar-shortcuts" id="sidebar-shortcuts">
			<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
				<button class="btn btn-success">
					<i class="ace-icon fa fa-signal"></i>
				</button>

				<button class="btn btn-info">
					<i class="ace-icon fa fa-pencil"></i>
				</button>

				<button class="btn btn-warning">
					<i class="ace-icon fa fa-users"></i>
				</button>

				<button class="btn btn-danger">
					<i class="ace-icon fa fa-cogs"></i>
				</button>
			</div>

			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span> <span class="btn btn-info"></span>

				<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
			</div>
		</div>
		<ul class="nav nav-list">
			<li class="active"><a href="AdminForward"> <i
					class="menu-icon fa fa-desktop"></i> <span class="menu-text">
						Admin page </span>
			</a> <b class="arrow"></b></li>

			<li class=""><a href="#" class="dropdown-toggle"> <i
					class="menu-icon fa fa-pencil-square-o"></i> <span
					class="menu-text"> Edit theme </span> <b
					class="arrow fa fa-angle-down"></b>
			</a> <b class="arrow"></b>

				<ul class="submenu">
					<li class=""><a href="SlideTopForward"> <i
							class="menu-icon fa fa-caret-right"></i> Slide Top
					</a> <b class="arrow"></b></li>

					<li class=""><a href="BannerForward"> <i
							class="menu-icon fa fa-caret-right"></i> Banner
					</a> <b class="arrow"></b></li>
				</ul></li>

			<li class=""><a href="#" class="dropdown-toggle"> <i
					class="menu-icon fa fa-list-alt"></i> <span class="menu-text">Show
				</span> <b class="arrow fa fa-angle-down"></b>
			</a> <b class="arrow"></b>

				<ul class="submenu">
					<li class=""><a href="ProductsForward?pageid=1"> <i
							class="menu-icon fa fa-caret-right"></i> Products
					</a> <b class="arrow"></b></li>
					<li class=""><a href="VideoForward"> <i
							class="menu-icon fa fa-caret-right"></i> New Video
					</a> <b class="arrow"></b></li>


				</ul></li>

			<li class=""><a href="#" class="dropdown-toggle"> <i
					class="menu-icon fa fa-list-alt"></i> <span class="menu-text">Edit
						Content </span> <b class="arrow fa fa-angle-down"></b>
			</a> <b class="arrow"></b>

				<ul class="submenu">
					<li class=""><a href="BlogForward"> <i
							class="menu-icon fa fa-caret-right"></i> Edit blog
					</a> <b class="arrow"></b></li>
					<li class=""><a href="UploadAvatarIntroduce"> <i
							class="menu-icon fa fa-caret-right"></i> Edit about
					</a> <b class="arrow"></b></li>


				</ul></li>

		</ul>
		<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
			<i id="sidebar-toggle-icon"
				class="ace-icon fa fa-angle-double-left ace-save-state"
				data-icon1="ace-icon fa fa-angle-double-left"
				data-icon2="ace-icon fa fa-angle-double-right"></i>
		</div>
	</div>

</body>
</html>