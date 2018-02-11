<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:include="/common/header :: header">
<title>Projecttracker - Login</title>
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
<form class="form-horizontal" method="post" th:object="${user}">
<div id="errors"></div>
<p class="logintext">Please enter your username and password below:</p>
<div class="form-group">
<label for="username" class="control-label col-sm-1">Username</label>
<div class="col-sm-4"><input type="text" class="form-control" th:field="*{username}"/></div>
</div>
<div class="form-group">
<label for="password" class="control-label col-sm-1">Password</label>
<div class="col-sm-4"><input type="password" class="form-control" th:field="*{password}"/></div>
</div>
<div class="form-group">        
      <div class="col-sm-4">
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-log-in"></span> Login</button>
			<a id="registerbutton" class="btn btn-default" href="/register"><span class="glyphicon glyphicon-pencil"></span> Register</a>
      </div>
</div>
<div class="form-group">        
      <div class="col-sm-4">
			<a id="forgottenpassword" href="/forgot-password">Forgotten your password?</a></div>
</div>
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