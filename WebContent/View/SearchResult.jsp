<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<c:if test="${msg != null}">
			<p
				style="font-size: 34px; color: red; padding-left: 400px; padding-top: 100px"><%=request.getAttribute("msg")!= null ? request.getAttribute("msg") : "" %></p>
		</c:if>
		<c:if test="${msg == null}">
			<c:forEach items="${listProduct}" var="list">
				<c:if test="${list.discount == 0}">
					<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-img wrap-pic-w of-hidden pos-relative">
								<img src="ImageUpload/${list.avartar}" alt="IMG-PRODUCT"
									height=300>

								<div class="block2-overlay trans-0-4">
									<a href="#"
										class="block2-btn-addwishlist hov-pointer trans-0-4"> <i
										class="icon-wishlist icon_heart_alt" aria-hidden="true"></i> <i
										class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
									</a>

									<div class="block2-btn-addcart w-size1 trans-0-4">
										<!-- Button -->
										<button
											class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
											Add to Cart</button>
									</div>
								</div>
							</div>

							<div class="block2-txt p-t-20">
								<a href="product-detail.html"
									class="block2-name dis-block s-text3 p-b-5">
									${list.productName} </a> <span class="block2-price m-text6 p-r-5">
									${list.price} </span>
							</div>
						</div>
					</div>

				</c:if>
				<c:if test="${list.discount != 0}">

					<div class="col-sm-12 col-md-6 col-lg-4 p-b-50">
						<!-- Block2 -->
						<div class="block2">
							<div
								class="block2-img wrap-pic-w of-hidden pos-relative block2-labelsale">
								<img src="ImageUpload/${list.avartar}" height=300
									alt="IMG-PRODUCT">

								<div class="block2-overlay trans-0-4">
									<a href="#"
										class="block2-btn-addwishlist hov-pointer trans-0-4"> <i
										class="icon-wishlist icon_heart_alt" aria-hidden="true"></i> <i
										class="icon-wishlist icon_heart dis-none" aria-hidden="true"></i>
									</a>

									<div class="block2-btn-addcart w-size1 trans-0-4">
										<!-- Button -->
										<button
											class="flex-c-m size1 bg4 bo-rad-23 hov1 s-text1 trans-0-4">
											Add to Cart</button>
									</div>
								</div>
							</div>

							<div class="block2-txt p-t-20">
								<a href="product-detail.html"
									class="block2-name dis-block s-text3 p-b-5">
									${list.productName} </a> <span
									class="block2-oldprice m-text7 p-r-5"> ${list.price} </span> <span
									class="block2-newprice m-text8 p-r-5"> ${list.price*(100 - list.discount)/100}$
								</span>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</c:if>
	</div>

</body>
</html>