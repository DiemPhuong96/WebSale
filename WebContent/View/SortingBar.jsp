<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="flex-sb-m flex-w p-b-35">
		<div class="flex-w">
			<div class="rs2-select2 bo4 of-hidden w-size12 m-t-5 m-b-5 m-r-10">
				<select id="sorting1" class="selection-2" name="sorting">
					<option value="0">Default Sorting</option>
					<option value="ASC">Price: low to high</option>


					<option value="DESC">Price: high to low</option>
				</select>
			</div>

			<div class="rs2-select2 bo4 of-hidden w-size12 m-t-5 m-b-5 m-r-10">
				<select id="sortByPrice" class="selection-2" name="sorting">
					<option value="0">Price</option>
					<option value="50">$0.00 - $50.00</option>
					<option value="100">$50.00 - $100.00</option>
					<option value="150">$100.00 - $150.00</option>
					<option value="200">$150.00 - $200.00</option>
					<option value="200+">$200.00+</option>

				</select>
			</div>
		</div>


	</div>
</body>
</html>