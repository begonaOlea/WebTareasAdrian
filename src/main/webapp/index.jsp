<%-- 
    Document   : index
    Created on : 22-dic-2020, 10:19:35
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <%@include file="WEB-INF/bootStrap.html" %>
    </head>
    <body>
        <%@include file="WEB-INF/navbar.jspf" %>
        <div class="container-fluid" style="margin-top: 30 px">
            <div class="row justify-content-center" style="margin-top: 30px">
                <h1> Gestiona tu PYME comodamente</h1>
            </div>
            <div class="row justify-content-center" style="margin-top: 20px">
                <div class="col">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-header">
                            <h4 class="my-0 fw-normal"> Plan gratuito</h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title"> 0€</h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>2 usuarios equipo</li>
                                <li> 2GB almacenamiento</li>
                                <li> Sin ayuda del soporte</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-header">
                            <h4 class="my-0 fw-normal"> Plan premium</h4>
                        </div>
                        <div class="card-body">
                            <h1 class="card-title pricing-card-title"> 15€</h1>
                            <ul class="list-unstyled mt-3 mb-4">
                                <li>10 usuarios equipo</li>
                                <li> 15GB almacenamiento</li>
                                <li> Soporte en remoto</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
