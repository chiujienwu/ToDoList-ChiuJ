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
    <title>My Very Scary ToDo List</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Table with Add and Delete Row Feature</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../resources/css/style.css">


</head>

<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-8"><h2>Task <b>List</b></h2></div>
                <div class="col-sm-4">
                    <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                </div>
            </div>
        </div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Task ID</th>
                <th>Task Name</th>
                <th>Due Date</th>
                <th>Complete</th>
                <th>Category</th>
                <th>Detail</th>
                <th>Priority</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="anotherTaskList" items="${anotherTaskList}">
            <tr>
                <td>${anotherTask.taskId}</td>
                <td>${anotherTask.taskName}</td>
                <td>${anotherTask.taskDueDate}</td>
                <td>${anotherTask.taskComplete}</td>
                <td>${anotherTask.taskCategory}</td>
                <td>${anotherTask.taskDetail}</td>
                <td>${anotherTask.taskPriority}</td>
                    <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                    <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                    <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                </td>
            </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
