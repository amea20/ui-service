<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>ProjectTracker - Edit project</title>
<!--Start of container-->
<div id="container">
<form:form class="form-horizontal" method="post" modelAttribute="project">
<div id="errors"><form:errors path="*" cssClass="has-error"/></div>
<div class="form-group">
<form:label path="projectTitle" class="control-label col-sm-3">Project title:</form:label>
<div class="col-sm-6"><form:input type="text" path="projectTitle" class="form-control"></form:input></div>
</div>
<div class="form-group">
<form:label path="status" class="control-label col-sm-3">Status:</form:label>
<div class="col-sm-3"><form:select path="status" id="statusUpdate" class="form-control">
<option value="Not Started">Not Started</option>
<option value="In Progress">In Progress</option>
<option value="Completed">Completed</option></form:select>
</div>
</div>
<div class="form-group">
<form:label path="targetDate" class="control-label col-sm-3">Target date:</form:label>
<div class="col-sm-3"><form:input type="text" id="datepicker" path="targetDate" class="form-control" ></form:input></div>
</div>
<div class="form-group">
<form:label path="usersAllowed" class="control-label col-sm-3">Users allowed access to project:</form:label>
<div class="col-sm-6"><form:textarea path="usersAllowed" type="text" class="form-control"></form:textarea></div>
</div>
<div class="form-group"><button id="editproject" class="btn btn-default" type="submit">Update project</button></div>
</form:form>
</div>
<!--End of container-->
<%@ include file="../common/footer.jsp" %>