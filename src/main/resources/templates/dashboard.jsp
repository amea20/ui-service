<%@ include file="common/header.jsp" %>
<%@ include file="common/navigation.jsp" %>
<title>ProjectTracker - Dashboard</title>
<!--Start of container-->
<div id="container">
<div id="greetings"><p>Welcome ${user.firstName}</p></div>
<div id="dashboard">
<h2>Dashboard:</h2>
<span class="glyphicon glyphicon-chevron-right"></span><p><a href="${project.projectID}/${task.taskID}">${task.totalChanges}</a> changes made to task ${task.taskDescription} in project ${project.projectTitle}.</p>
</div>
</div>
<!--End of container-->
<%@ include file="common/footer.jsp" %>