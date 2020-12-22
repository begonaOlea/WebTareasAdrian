<%-- 
    Document   : login
    Created on : 22-dic-2020, 10:17:25
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="/WEB-INF/bootStrap.html" %>
    </head>
    <body>
        <%@include file="/WEB-INF/navbar.jspf" %>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Introduce los datos de Acceso</h1>
                </div>
            </div>
            <form action="login" method="post" >
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" name="inputEmail"
                           id="email" placeholder="Introduce  email">
                </div>
                <div class="form-group">
                    <label for="pwd">Password</label>
                    <input type="password" class="form-control" name="inputPassword"
                           id="pwd" placeholder="Password">
                </div>
                <div class="btn-group" role="group">
                    <a href="createUser.jsp" class="btn btn-primary">Registrarse </a>
                    
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
            <c:if test="${not empty requestScope.msgErrorLogin }" >
                <div class="alert alert-success" role="alert">
                    ${requestScope.msgErrorLogin}
                </div>
            </c:if>
        </div>
    </body>
</html>
