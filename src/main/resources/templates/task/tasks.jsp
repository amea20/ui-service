<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navigation.jsp" %>
<title>ProjectTracker - Tasks</title>
<!--Start of container-->
<div id="container">
<div id="sortResults">
<label for="sortTasks">Sort by:</label>
<select id="sortTasks">
	<option value="all">All</option>
	<option value="open">Open</option>
	<option value="closed">Closed</option>
</select>
</div>
<div id="tablesort">
<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>Task description</th>
        <th>Date started</th>
        <th>Target date</th>
		<th>Date completed</th>
        <th>Action</th>
      </tr>
    </thead>
    <c:forEach var="task" items="${tasks}">
    <tbody>
      <tr>
        <td>${task.taskDesc}</td>
        <td><fmt:formatDate value="${task.dateStarted}" pattern="dd/MM/yyyy" /></td>
        <td><fmt:formatDate value="${task.targetDate}" pattern="dd/MM/yyyy" /></td>
		<td><fmt:formatDate value="${task.dateCompleted}" pattern="dd/MM/yyyy" /></td>
        <td id="action"><input type="checkbox" id="action" name="task" /></td>
      </tr>
     </tbody>
     </c:forEach>
  </table>
  </div>
<div class="actionButtons">
  <a href="/project/${projectID}/task/add" class="btn btn-default">Add</a>
  <button type="button" class="btn btn-default" onClick="editTask()">Edit</button>
  <button type="button" class="btn btn-default">Delete</button>
  <button id="select-deselect" type="button" class="btn btn-default" onClick="toggleCheckbox()">Select/Deselect all</button>
  <button id="exportButton" type="button" class="btn btn-default">Export</button>
</div>
</div>
<!--End of container-->
<%@ include file="../common/footer.jsp" %>