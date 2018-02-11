<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head th:include="/common/header :: header">
<title>Projecttracker - Forgot password</title>
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
<div id="errors" style="display:none"><div class="has-error"></div></div>
<p class="forgotpassword">Please enter your email address below in order to receive your temporary password:</p>
<form class="form-horizontal">
<div class="form-group">
<label class="control-label col-sm-1">Email address:</label>
<div class="col-sm-4"><input id="forgottenpasswordinput" type="text" class="form-control"></input></div>
</div>
<!--data-toggle="modal"-->
<div class="form-group">        
      <div class="col-sm-4">
        <button id="sendpassword" type="button"  data-target="#resetPassword" class="btn btn-default"><span class="glyphicon glyphicon-envelope"></span> SEND PASSWORD</button>
      </div>
</div>

</form>

<!-- Start of Modal -->
  <div class="modal fade" id="resetPassword" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">PASSWORD RESET</h4>
        </div>
        <div class="modal-body">
          <p>A temporary password has been sent to your email address <span id="emailAddress"></span></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<!-- End of Modal -->  
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