<%@ include file="common/header.jsp" %>
<%@ include file="common/navigation.jsp" %>
<title>List of Users</title>
<div class="container">
<table class="table table-striped">
<caption><spring:message code="user.caption"/></caption>
<thead>
<tr>
<th>Username</th>
<th>First name</th>
<th>Surname</th>
<th>DOB</th>
<th>Email Address</th>
</tr>
</thead>

<tbody>
<c:if test="${not empty users}">
<c:forEach items="${users}" var="user">
	<tr>
	<td><c:out value="${user.username}"/></td>
	<td><c:out value="${user.firstName}"/></td>
	<td><c:out value="${user.lastName}"/></td>
	<td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.DOB}"/></td>
	<td><c:out value="${user.emailAddress}"/></td>
	<td><a class="btn btn-info" href="/update-user?username=${user.username}">Update</a></td>
	<td><a class="btn btn-danger" href="/delete-user?username=${user.username}">Delete</a></td>
	</tr>
</c:forEach>
</c:if>
</tbody>



</table>
<div>
<a class="btn btn-success" href="/add-user">Add new user</a>
</div>
</div>
<%@ include file="common/footer.jsp" %>