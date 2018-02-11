<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>ProjectTracker - Create Task</title>
<!--Start of container-->
<div id="container">
<p>Please add the project details in the following section below:</p>
<form:form class="form-horizontal" method="post" modelAttribute="task">
<div id="errors"><form:errors path="*" cssClass="has-error"/></div>
<div class="form-group">
<form:label path="taskDesc" class="control-label col-sm-2">Task description:</form:label>
<div class="col-sm-6"><form:input path="taskDesc" type="text" class="form-control"></form:input></div>
</div>
<div class="form-group">
<form:label path="dateStarted" class="control-label col-sm-2">Date started:</form:label>
<div class="col-sm-3"><form:input path="dateStarted" id="datepicker" class="form-control" type="text"></form:input></div>
</div>
<div class="form-group">
<form:label path="targetDate" class="control-label col-sm-2">Target date:</form:label>
<div class="col-sm-3"><form:input type="text" path="targetDate" id="datepicker" class="form-control" type="text"></form:input></div>
</div>
<div class="form-group">
<form:label path="dateCompleted" class="control-label col-sm-2">Date completed:</form:label>
<div class="col-sm-3"><form:input path="dateCompleted" id="datepicker" class="form-control" type="text"></form:input></div>
</div>
<div class="form-group">
<form:label path="assignedTo" class="control-label col-sm-2">Assigned to:</form:label>
<div class="col-sm-3">
<form:select multiple path="assignedTo" id="usertype" class="form-control">
	<option value="user">Ahmed El Agha</option>
</form:select></div>
</div>
<div class="form-group">
<form:label path="files" class="control-label col-sm-2">Upload file:</form:label>
<div id="uploadfile" class="col-sm-6"><form:input path="files" id="input-1" type="file" multiple class="file"></form:input></div>
</div>
<div class="form-group">
<form:label path="comments" class="control-label col-sm-2">Comments:</form:label>
<div class="col-sm-6"><form:textarea path="comments" id="commentsinput" type="text" class="form-control"></form:textarea></div>
</div>
<div class="form-group"><button id="addcommentbutton" class="btn btn-default" type="button">Add comment</button></div>
<div class="commentsfield"></div>
<div class="form-group"><button id="addtask" class="btn btn-default" type="submit">Add task</button></div>
</form:form>
</div>
<!--End of container-->
<%@ include file="../common/footer.jsp" %>