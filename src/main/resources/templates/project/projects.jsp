<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>
<title>ProjectTracker - Projects</title>
<!--Start of container-->
<div id="container">
<div id="sortResults">
<label for="sortProjects">Sort by:</label>
<select id="sortProjects">
	<option value="all">All</option>
	<option value="open">Open</option>
	<option value="closed">Closed</option>
</select>
</div>
<div id="tablesort">
<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>Project</th>
        <th>Date started</th>
        <th>Target date</th>
		<th>Date completed</th>
        <th>Status</th>
		<th>Tasks Update</th>
        <th>Action</th>
      </tr>
    </thead>
    <c:forEach var="project" items="${projects}">
    <tbody>
      <tr>
        <td id="projecttitle"><a href="/${project.projectID}/tasks">${project.projectTitle}</a></td>
        <td><fmt:formatDate value="${project.dateStarted}" pattern="dd/MM/yyyy" /></td>
        <td><fmt:formatDate value="${project.targetDate}" pattern="dd/MM/yyyy" /></td>
		<td><fmt:formatDate value="${project.dateCompleted}" pattern="dd/MM/yyyy" /></td>
        <td>${project.status}</td>
		<td>${task.closedTasks} out of ${task.totalTasks} completed</td>
		<td id="action"><input type="checkbox" id="action" name="project" /></td>
      </tr>
     </tbody>
     </c:forEach>
  </table>
  </div>
  <div class="actionButtons">
  <a class="btn btn-default" href="/project/add">Add</a>
  <button id="edit" type="button" class="btn btn-default" onClick="editProject()">Edit</button>
  <button id="delete" type="button" class="btn btn-default">Delete</button>
  <button id="select-deselect" type="button" class="btn btn-default" onClick="toggleCheckbox()">Select/Deselect all</button>
  <button id="exportButton" type="button" class="btn btn-default">Export</button>
  </div>
</div>
<!--End of container-->
<%@ include file="../common/footer.jsp" %>