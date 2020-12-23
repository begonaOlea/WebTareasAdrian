/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tarea.servlets;

import com.tarea.dominio.*;
import com.tarea.excepcion.DBException;
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
public class CreateTarea extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paramDesc = request.getParameter("inputDescripcion");
        HttpSession session=request.getSession();
        Usuario user=(Usuario) session.getAttribute("usuario");
        String msgError = null;
        String msgErrorAlta = null;
        boolean valido = true;

        // 2.1. VALIDAR 
        if (paramDesc == null || paramDesc.trim().length() == 0) {
            msgError= "Debe indicar la descripcion";
            valido = false;
        }
         if (valido) {
            try {
                int idUser=user.getId();
                int idTarea=DB.getUltimoIdTarea()+1;
                Tarea t=new Tarea(idTarea,paramDesc , Estado.TODO, idUser);
                user.addTarea(t);
                DB.setUltimoIdTarea(idTarea);
                
            } catch (Exception e) {
                msgErrorAlta= e.getMessage();
                valido = false;               
            }
        }//fin validacion

        // mANDAR A VISTA
        String jspAMostrar = "";
        if (valido) {
            jspAMostrar = "lista-tareas.jsp";
        } else {
            jspAMostrar = "createTarea.jsp";
            request.setAttribute("msgError", msgError);
            request.setAttribute("msgErrorAlta", msgErrorAlta);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(jspAMostrar);
        rd.forward(request, response);
    }

    

}
