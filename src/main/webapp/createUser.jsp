<%-- 
    Document   : createUser
    Created on : 22-dic-2020, 10:29:58
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Usuario</title>
        <%@include file="/WEB-INF/bootStrap.html" %>
    </head>
    <body>
        <%@include file="/WEB-INF/navbar.jspf" %>
        <div class="container">
            <h1> Crear Usuario</h1>
            <form action="alta-user" method="post">
                <div class="mb-3">
                    <label for="inputEmail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="inputEmail" name="inputEmail" >
                </div>
                <div class="mb-3">
                    <label for="inputPassword" class="form-label">Password</label>
                    <input type="text" class="form-control" id="inputPassword" name="inputPassword">
                </div>
                <div class="mb-3">
                    <label for="inputNombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="inputNombre" name="InputNombre">
                </div>
                <div class="mb-3">
                    <label for="inputApellidos" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" id="inputApellidos" name="inputApellidos" >
                </div>
                <button type="submit" class="btn btn-primary">Crear</button>
            </form>
        </div>
    </body>
</html>
