<%-- 
    Document   : createTarea
    Created on : 22-dic-2020, 10:18:04
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="/WEB-INF/bootStrap.html" %>
    </head>
    <body>
        <%@include file="/WEB-INF/navbar.jspf" %>
        <div class="container">
            <h1> Nueva Tarea</h1>
            <form action="alta-tarea" method="post">
                <div class="mb-3">
                    <label for="inputDescripcion" class="form-label">Email</label>
                    <input type="text" class="form-control" id="inputDescripcion" name="inputDescripcion" >
                </div>
                <div class="mb-3">
                    <input type="hidden" class="form-control" id="inputIdUser" name="inputIdUser" value=" ${sessionScope.usuario.id} ">
                </div>
                <button type="submit" class="btn btn-primary">Crear</button>
            </form>
    </body>
</html>
