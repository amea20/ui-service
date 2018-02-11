<%@ include file="common/header.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Update password</title>
<div class="container">
<h1>Update Password</h1>
<p>Please enter your new password and click on "Update Password".</p>
<form:form method="post" commandName="user">
<form:errors path="*" cssClass="has-error"/>
<fieldset class=form-group>
<label>Old password</label>
<input name="oldPassword" type="password" class="form-control"></input>
<form:label path="password">New password</form:label>
<form:input path="password" type="password" class="form-control"></form:input>
<label>Confirm new password</label>
<input name="confirmPassword" type="password" class="form-control"></input>
<input class="btn btn-primary" type="Submit" value="UPDATE PASSWORD"></input>
</fieldset>
</form:form>
</div>
<%@ include file="common/footer.jsp" %>