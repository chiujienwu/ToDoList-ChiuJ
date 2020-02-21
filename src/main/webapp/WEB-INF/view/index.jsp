<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <jsp:include page="/WEB-INF/view/includes/header.jsp"/>

<body>
<a href="login.jsp">Login</a>
<img src="../resources/img/logo.png" alt="clipboard checklist image">
<h1>My All Important ToDo Checklist</h1>
<a href="../list2">View that Scary List</a>
<h1>Task ID Search</h1>
<form method="get" action="../search">
    <input type="number" name="idnumber" ><br>
    <input type="submit" name="submit" id="Submit" value="Search">
</form>

<jsp:include page="/WEB-INF/view/includes/footer.jsp"/>
