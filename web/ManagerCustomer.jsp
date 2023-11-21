<%-- 
    Document   : ManagerCustomer
    Created on : Mar 27, 2023, 10:49:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Account</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/ManagerProduct.css" rel="stylesheet" type="text/css"/>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
        <script>
            function back() {
                window.location.href = "ProductList";
            }
             function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if(c)
                {
                    window.location.href = "delete?pid="+id;
                }
            }
        </script>
</head>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <h2>Manage <b>Account</b></h2>   
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                             <th>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span>
                            </th>
                            <th>ID</th>
                            <th>Account</th>
                            <th>Pass</th>
                            <th>Name</th>
                            <th>email</th>
                            <th>Active</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="p">
                            <tr>
                                <td>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                        <label for="checkbox1"></label>
                                    </span>
                                </td>
                                <td>${p.getAccountId()}</td>
                                <td>${p.getAccountName()}</td>
                                <td>${p.getPassword()}</td>
                                <td>${p.getCustomer_name()}</td>
                                <td>${p.getEmail()}</td>
                                <c:if test="${p.getRoleId() == 1}">
                                    <td>Customer</td>
                                </c:if>
                                <c:if test="${p.getRoleId() == 2}">
                                    <td>Manager</td>
                                </c:if>
                                    <c:if test="${p.getRoleId() == 3}">
                                    <td>Admin</td>
                                </c:if>
                                <td>
                                    <a href="loadAccount?aid=${p.getAccountId()}"  class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
            </div>
            
            <a href="#">
                <button type="button" class="btn btn-primary" onclick="back()">Back to home</button>
                <script src="js/ManagerProduct.js" type="text/javascript"></script>
                </body>
                </html>
