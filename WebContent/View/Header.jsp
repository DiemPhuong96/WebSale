<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
</head>
<body>

	<!-- Header -->

	<header class="header1"> <!-- Header desktop -->
	<div class="container-menu-header">
		<div class="topbar">
			<div class="topbar-social">
				<a href="#" class="topbar-social-item fa fa-facebook"></a> <a
					href="#" class="topbar-social-item fa fa-instagram"></a> <a
					href="#" class="topbar-social-item fa fa-pinterest-p"></a> <a
					href="#" class="topbar-social-item fa fa-snapchat-ghost"></a> <a
					href="#" class="topbar-social-item fa fa-youtube-play"></a>
			</div>

			<span class="topbar-child1"> Free shipping for standard order
				over $100 </span>

			<div class="topbar-child2">
				<span class="topbar-email"> fashe@example.com </span>

			</div>
		</div>

		<div class="wrap_header">
			<!-- Logo -->
			<a href="HomeController" class="logo"> <img
				src="Template/FrontEnd/images/icons/logo.png" alt="IMG-LOGO">
			</a>

			<!-- Menu -->
			<div class="wrap_menu">
				<nav class="menu">
				<ul class="main_menu">
					<li><a href="HomeController">Home</a></li>

					<li><a href="ShopForward?pageid=1">Shop</a></li>


					<li><a href="AdminForward">Features</a></li>

					<li><a href="BlogFrontEndForward?pageid=1">Blog</a></li>

					<li><a href="AboutForward">About</a></li>

					<li><a href="MessageForward">Contact</a></li>
				</ul>
				</nav>
			</div>

			<!-- Header Icon -->
			<div class="header-icons">
				<% if(session.getAttribute("sessionName") == null){ %>
				<a href="RegisterForward" class="header-wrapicon1 dis-block"
					style="color: crimson;"> Login <!--img src="Template/FrontEnd/images/icons/icon-header-01.png" class="header-icon1" alt="ICON"-->
				</a>
				<%
				}
				else
				{
				%>

				<ul class="nav ace-nav">
					<li class="light-blue dropdown-modal"><a
						data-toggle="dropdown" href="#" class="dropdown-toggle"> <img
							src="Template/FrontEnd/images/icons/icon-header-01.png"
							class="header-icon1" alt="ICON">


					</a>

						<ul
							class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">

							<li style="padding-left: 40px;"><a href="LogoutController">

									<%=session.getAttribute("sessionName")%>
							</a></li>

							<li style="padding-left: 40px;"><a href="LogoutController">
									<i class="ace-icon fa fa-power-off"></i> Logout
							</a></li>


						</ul></li>
				</ul>



				<span class="linedivide1"></span>

				<div class="header-wrapicon2">
					<img src="Template/FrontEnd/images/icons/icon-header-02.png"
						class="header-icon1 js-show-header-dropdown" alt="ICON"> <span
						class="header-icons-noti">0</span>

					<!-- Header cart noti -->
					<div class="header-cart header-dropdown">
						<ul class="header-cart-wrapitem">
							<li class="header-cart-item">
								<div class="header-cart-item-img">
									<img src="Template/FrontEnd/images/item-cart-01.jpg" alt="IMG">
								</div>

								<div class="header-cart-item-txt">
									<a href="#" class="header-cart-item-name"> White Shirt With
										Pleat Detail Back </a> <span class="header-cart-item-info">
										1 x $19.00 </span>
								</div>
							</li>

							<li class="header-cart-item">
								<div class="header-cart-item-img">
									<img src="Template/FrontEnd/images/item-cart-02.jpg" alt="IMG">
								</div>

								<div class="header-cart-item-txt">
									<a href="#" class="header-cart-item-name"> Converse All
										Star Hi Black Canvas </a> <span class="header-cart-item-info">
										1 x $39.00 </span>
								</div>
							</li>

							<li class="header-cart-item">
								<div class="header-cart-item-img">
									<img src="Template/FrontEnd/images/item-cart-03.jpg" alt="IMG">
								</div>

								<div class="header-cart-item-txt">
									<a href="#" class="header-cart-item-name"> Nixon Porter
										Leather Watch In Tan </a> <span class="header-cart-item-info">
										1 x $17.00 </span>
								</div>
							</li>
						</ul>

						<div class="header-cart-total">Total: $75.00</div>

						<div class="header-cart-buttons">
							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="cart.html"
									class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									View Cart </a>
							</div>

							<div class="header-cart-wrapbtn">
								<!-- Button -->
								<a href="#"
									class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
									Check Out </a>
							</div>
						</div>
					</div>
				</div>
				<%} %>
			</div>
		</div>
	</div>

	</header>


	<!-- Header -->
</body>
</html>