<%@ include file="common/header.jsp" %>
<%@ include file="common/navigation.jsp" %>
<title>Welcome</title>
<div class="container">
<p>Welcome <%=session.getAttribute("user") %>.

You are now authenticated.</p>
</div>
<%@ include file="common/footer.jsp" %>