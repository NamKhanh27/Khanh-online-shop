<%-- 
    Document   : EditOrder
    Created on : Oct 21, 2023, 5:31:11 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Order</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>
    <body>
        <div class="container">

            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="EditOrder" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Order</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${ord.getOrderId()}"  name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Date</label>
                                    <input value="${ord.getOrderDate()}" name="date" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Customer ID</label>
                                    <input value="${ord.getCustomerId()}" name="cusID" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Total</label>
                                    <input value="${ord.getTotal()}" name="total" type="text" class="form-control" required>
                                </div>
                 
                                <div class="form-group">
                                    <label>Status</label>
                                    <select name="status" class="form-control" required>
                                        <option class="selected" value="" disabled>Select</option>
                                        <option value="0">Not Available</option>
                                        <option value="1">Available</option>

                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script src="js/manager.js" type="text/javascript"></script>

    </body>
</html>
