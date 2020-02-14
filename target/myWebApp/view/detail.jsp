<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 1/28/20
  Time: 7:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ToDo Task Detail</title>
</head>
<body>

<form>
    <div class="form-group row">
        <label for="taskID" class="col-sm-2 col-form-label">Task ID</label>
        <div class="col-sm-10">
            <input type="number" class="form-control" name="taskID" id="taskID" placeholder="Task ID">
        </div>
    </div>
    <div class="form-group row">
        <label for="taskDate" class="col-sm-2 col-form-label">Task Date</label>
        <div class="col-sm-10">
            <input type="date" class="form-control" name="taskDate" id="taskDate" placeholder="Task Date">
        </div>
    </div>
    <div class="form-group row">
        <label for="taskDesc" class="col-sm-2 col-form-label">Task Description</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" name="taskDesc" id="taskDesc" placeholder="Description">
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <label class="form-check-label"><input type="radio" name="priority" value="low"> Low</label>
            <label class="form-check-label"><input type="radio" name="priority" value="medium"> Medium</label>
            <label class="form-check-label"><input type="radio" name="priority" value="high"> High</label>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-primary">Save Task</button>
        </div>
    </div>
</form>

</body>
</html>
