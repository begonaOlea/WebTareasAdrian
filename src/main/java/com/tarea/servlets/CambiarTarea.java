/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tarea.servlets;

import com.tarea.dominio.*;
import com.tarea.dominio.Usuario;
import com.tarea.servicios.DB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class CambiarTarea extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Atributos llegada
        String paramIdTarea = request.getParameter("id");
        Estado nuevoEstado = Estado.valueOf(request.getParameter("nuevoestado"));
        HttpSession session=request.getSession();
        Usuario user=(Usuario) session.getAttribute("usuario");
        String msgError = null;
        String msgErrorModif = null;
        boolean valido=true;
        
        //Validacion id
        if (paramIdTarea == null || paramIdTarea.trim().length() == 0) {
            msgError= "Debe indicar la descripcion";
            valido = false;
        }
        if (valido) {
            try {
                int idUser=user.getId();
                int idTarea=Integer.parseInt(paramIdTarea);
                DB.setEstadoTarea(idUser, idTarea, nuevoEstado);
                
            } catch (Exception e) {
                msgErrorModif= e.getMessage();
                valido = false;               
            }
        }
            String jspAMostrar = "";
            if (valido) {
                jspAMostrar = "lista-tareas.jsp";
            } else {
                jspAMostrar = "lista-tareas.jsp";
                request.setAttribute("msgError", msgError);
                request.setAttribute("msgErrorAlta", msgErrorModif);
            }

            RequestDispatcher rd = request.getRequestDispatcher(jspAMostrar);
            rd.forward(request, response);
    }
    
    

}
