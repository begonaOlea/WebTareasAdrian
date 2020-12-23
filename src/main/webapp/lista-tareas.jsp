<%-- 
    Document   : tareas
    Created on : 22-dic-2020, 10:16:47
    Author     : user
--%>

<%@page import="com.tarea.servicios.DB"%>
<%@page import="java.util.Collection"%>
<%@page import="com.tarea.dominio.*"%>
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
        <div class="container-fluid " style="margin-top: 30px">
            <div class="row justify-content-center">
                <div class="col-align-self-center">
                    <h1> 
                        <% 
                            Usuario user=(Usuario)session.getAttribute("usuario");
                            String s="LISTADO DE "+user.getNombre().toUpperCase();
                            out.print(s);
                        %>
                        <%-- LISTADO DE ${sessionScope.usuario.nombre} --%>
                    </h1>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-align-self-center">
                    <a href="createTarea.jsp"> 
                        <img src="https://www.flaticon.es/svg/static/icons/svg/1368/1368593.svg" class="rounded" style="width: 50px; height: 50px" alt="Fallo">
                    </a>
                </div>
            </div>
            <div class="row justify-content-around">
                <%
                    Collection<Tarea> listaTareas= DB.getListaTareaUser(user.getId());
                %>
                <div class="col-4-align-self-center" style="margin-top: 30px">
                    <table class="table">
                        <thead>
                           <tr>
                               <th>TO DO</th>
                               <th></th>
                           </tr>
                       </thead>
                       <tbody>
                           <% for(Tarea t:listaTareas){ %>
                           <tr>
                               <% if(t.getEstado()==Estado.TODO){ %>
                                    <td> <%= t.getDescripcion() %></td>
                                    <td> 
                                        <a href="cambiar-tarea?id=<%= t.getIdTarea()%>&nuevoestado=<%= Estado.INPROGRESS %>" > 
                                             <img src="https://www.flaticon.es/svg/static/icons/svg/702/702132.svg" class="rounded" style="width: 25px; height: 25px" alt="Fallo">
                                         </a>
                                    </td>
                               <% } %>
                           </tr>
                           <% } %>
                       </tbody>
                    </table>
                </div>
                <div class="col-4-align-self-center" style="margin-top: 30px">
                    <table class="table">
                        <thead>
                           <tr>
                               <th></th>
                               <th>IN PROGRESS</th>
                               <th></th>
                           </tr>
                       </thead>
                       <tbody>
                           <% for(Tarea t:listaTareas){ %>
                           <tr>
                               <% if(t.getEstado()==Estado.INPROGRESS){ %>
                                    <td>
                                        <a href="cambiar-tarea?id=<%= t.getIdTarea()%>&nuevoestado=<%= Estado.TODO %>"> 
                                             <img src="https://www.flaticon.es/svg/static/icons/svg/592/592275.svg" class="rounded" style="width: 25px; height: 25px" alt="Fallo">
                                         </a>
                                    </td>
                                    <td> <%= t.getDescripcion() %></td>
                                    <td> 
                                        <a href="cambiar-tarea?id=<%= t.getIdTarea()%>&nuevoestado=<%= Estado.DONE %>"> 
                                             <img src="https://www.flaticon.es/svg/static/icons/svg/702/702132.svg" class="rounded" style="width: 25px; height: 25px" alt="Fallo">
                                         </a>
                                    </td>
                               <% } %>
                           </tr>
                           <% } %>
                       </tbody>
                    </table>
                </div>
                <div class="col-4-align-self-center" style="margin-top: 30px">
                    <table class="table">
                        <thead>
                           <tr>
                               <th></th>
                               <th>DONE</th>
                           </tr>
                       </thead>
                       <tbody>
                           <% for(Tarea t:listaTareas){ %>
                           <tr>
                               <% if(t.getEstado()==Estado.DONE){ %>
                                    <td> 
                                        <a href="cambiar-tarea?id=<%= t.getIdTarea()%>&nuevoestado=<%= Estado.INPROGRESS %>"> 
                                             <img src="https://www.flaticon.es/svg/static/icons/svg/592/592275.svg" class="rounded" style="width: 25px; height: 25px" alt="Fallo">
                                         </a>
                                    </td>
                                    <td> <%= t.getDescripcion() %></td>
                               <% } %>
                           </tr>
                           <% } %>
                       </tbody>
                    </table>
                </div>
            </div>
                    
        </div>
    </body>
</html>
