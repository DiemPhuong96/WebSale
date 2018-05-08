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
	<c:forEach items="${listcmt}" var="list">

		<div class='container'>
			<div class="media comment-box">
				<div class="media-left">
					<a href="#"> <img class="img-responsive user-photo"
						src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
					</a>
				</div>
				<div class="media-body">
					<h4 class="media-heading">${list.name}</h4>
					<p>${list.content}.</p>

				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>