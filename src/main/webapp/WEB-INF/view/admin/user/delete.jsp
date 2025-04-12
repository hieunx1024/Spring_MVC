<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


            <html>

            <head>
                <meta charset='utf-8'>
                <meta http-equiv='X-UA-Compatible' content='IE=edge'>
                <title>Delete user with ${id}</title>
                <meta name='viewport' content='width=device-width, initial-scale=1'>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            </head>

            <body>
                <div class="container mt-5">
                    <div class="alert alert-danger">You are sure to delete user with id ${id} ?</div>
                    <form:form method="post" modelAttribute="newUser" action="/admin/user/delete">
                        <div class="mb-3" style="display: none;">
                            <label class="form-label">ID:</label>
                            <form:input value="${id}" type="text" class="form-control" path="id" />
                        </div>
                        <button class="btn btn-danger">comfirm</button>
                        <a href="/admin/user" class="btn btn-success mt-3">Cancel</a>
                    </form:form>
                </div>

            </body>

            </html>