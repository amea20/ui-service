<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:include="/common/header :: header">
<title>Projecttracker - Register</title>
</head>
<body>
<!--Start of pagecontainer-->
<div id="pagecontainer">
<!--Start of header-->
<div id="header">
<div id="logo">
<a href="/"><img src="/../images/logo.png"></img></a>
</div>
</div>
<!--End of header-->
<!--Start of container-->
<div id="container">
<h2>User Registration</h2>
<p class="register">Please register your details in the following section below:</p>
<form class="form-horizontal" method="post" th:object="${user}">
<div id="errors"></div>
<div class="column1">
<div class="form-group">
<label for="firstName" class="control-label col-sm-2">First name:</label>
<div class="col-sm-3"><input type="text" th:field="*{firstName}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="lastName" class="control-label col-sm-2">Last name:</label>
<div class="col-sm-3"><input type="text" th:field="*{lastName}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="dob" class="control-label col-sm-2">Date of birth:</label>
<div class="col-sm-3"><input id="datepicker" th:field="*{dob}" class="form-control" type="text"></input></div>
</div>
<div class="form-group">
<label for="emailAddress" class="control-label col-sm-2">Email address:</label>
<div class="col-sm-3"><input type="text" th:field="*{emailAddress}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="password" class="control-label col-sm-2">Password:</label>
<div class="col-sm-3"><input type="password" th:field="*{password}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="confirmPassword" class="control-label col-sm-2">Confirm password:</label>
<div class="col-sm-3"><input type="password" th:field="*{confirmPassword}" class="form-control"></input></div>
</div>
</div>
<div class="form-group">
<label for="country" class="control-label col-sm-2">Country:</label>
<div class="col-sm-3">
<select th:field="*{country}" id="countries" class="form-control" onchange="togglePostcode()">
	<option value="">Select a country</option>
	<option th:each="country : ${countries.entrySet()}"
	th:value="${country.key}" th:utext="${country.value}" />
</select>
</div>
</div>
<div id="postcodelookup" class="form-group">
<div class="col-sm-offset-2 col-sm-3"><input type="text" name="addpostcode" class="form-control"></input></div>
<div id="col-sm-offset-1 col-sm-4"><button id="postcodelookupbutton" type="button" class="btn btn-default">Postcode Lookup</button></div>
</div>
<div id="addressblock" class="form-group">
<div class="col-sm-offset-2 col-sm-3"><select id="addressList" class="form-control">
	
</select></div>
</div>
<div class="form-group">
<label for="address1" class="control-label col-sm-2">Address 1:</label>
<div class="col-sm-3"><input type="text" th:field="*{address1}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="address2" class="control-label col-sm-2">Address 2:</label>
<div class="col-sm-3"><input type="text" th:field="*{address2}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="address3" class="control-label col-sm-2">Address 3:</label>
<div class="col-sm-3"><input type="text" th:field="*{address3}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="city" class="control-label col-sm-2">Town/City:</label>
<div class="col-sm-3"><input type="text" th:field="*{city}" class="form-control"></input></div>
</div>
<div class="form-group">
<label for="postcode" class="control-label col-sm-2">Postcode:</label>
<div class="col-sm-3"><input type="text" th:field="*{postcode}" class="form-control"></input></div>
</div>
<div class="form-group"><button id="registrationbutton" class="btn btn-default" type="submit">Register</button></div>
</form>
</div>
<!--End of container-->
<!--Start of footer-->
<div id="footer" th:include="/common/footer :: footer">
</div>
<!--End of footer-->
</div>
<!--End of pagecontainer-->
</body>
</html>