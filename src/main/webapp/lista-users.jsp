<%-- 
    Document   : lista-users
    Created on : 22-dic-2020, 12:04:21
    Author     : user
--%>

<%@page import="com.tarea.dominio.Tarea"%>
<%@page import="com.tarea.dominio.Usuario"%>
<%@page import="com.tarea.servicios.DB"%>
<%@page import="java.util.Collection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Usuarios</title>
        <%@include file="/WEB-INF/bootStrap.html" %>
    </head>
    <body>
        <%@include file="/WEB-INF/navbar.jspf" %>
        <div class="container-fluid " style="margin-top: 50px">
            <div class="row justify-content-center">
                <div class="col-4">
                    <h1> Listado de libros disponibles</h1>
                </div>
            </div>
            <div class="row justify-content-center">
                <%
                    Collection<Usuario> listaUsuarios=DB.getListaUsuario();
                %>
                <table class="table col-10">
                 <thead>
                    <tr>
                        <th>id</th>
                        <th>Email</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Tareas Descr.</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Usuario l:listaUsuarios){ %>
                    <tr>
                        <td> <%= l.getId()%></td>
                        <td> <%= l.getEmail()%></td>
                        <td> <%= l.getNombre()%></td>
                        <td> <%= l.getApellidos()%></td>
                        <td> 
                            <ul>
                            <% for(Tarea t:l.getListaTareas()) {%>
                                <li> <%= t.getDescripcion()+" ---> "+t.getEstado()%></li>
                            <% } %>
                            </ul>
                        </td>
                       
                    </tr>
                    <% } %>
                </tbody>
            </table>
            </div>
            <div class="row justify-content-center">
                 <div class="col-align-self-center">
                    <h3> Generar nuevo usuario</h3>
                 </div>
            </div>     
             <div class="row justify-content-center">
                 <div class="col-align-self-center">
                    <a href="createUser.jsp"> 
                        <img src="https://www.flaticon.es/svg/static/icons/svg/1650/1650888.svg" class="rounded" style="width: 70px; height: 70px" alt="Fallo">
                    </a>
                 </div>
            </div>   
        </div>
    </body>
</html>
