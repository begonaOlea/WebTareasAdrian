/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tarea.servlets;

import com.tarea.dominio.Estado;
import com.tarea.dominio.Tarea;
import com.tarea.dominio.Usuario;
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
public class CreateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String paramEmail = request.getParameter("inputEmail");
        String paramPwd = request.getParameter("inputPassword");
        String paramNombre = request.getParameter("inputNombre");
        String paramApell = request.getParameter("inputApellidos");

        //2.  VALIDAR PARAMETROS
        String msgErrorEmail = null;
        String msgErrorPwd = null;
        String msgErrorNombre = null;
        String msgErrorApellidos = null;
        String msgErrorAlta = null;

        boolean valido = true;

        // 2.1. VALIDAR EMAIL
        if (paramEmail == null || paramEmail.trim().length() == 0) {
            msgErrorEmail = "Debe indicar el email del usuario";
            valido = false;
        }

        // 2.2. VALIDAR PASSWORS      
        if (paramPwd == null || paramPwd.trim().length() == 0) {
            msgErrorPwd = "Debe indicar una clave";
            valido = false;
        }

//        // 2.2. VALIDAR NOMBRE
//        if (paramNombre == null || paramNombre.trim().length() == 0) {
//            msgErrorNombre = "Debe indicar nombre ";
//            valido = false;
//        }
//         // 2.3. VALIDAR APELLIDOS
//        if (paramApell == null || paramApell.trim().length() == 0) {
//            msgErrorApellidos = "Debe indicar los apellidos ";
//            valido = false;
//        }

        //3.  SI NO HAY ALGUN ERROR intentar grabar un usuario y su primera tarea
        if (valido) {
            int id= DB.getUltimoIdUsuario()+1;
            int idTarea=DB.getUltimoIdTarea()+1;
            Usuario usuario = new Usuario(id ,paramEmail, paramPwd, paramNombre, paramApell);
            Tarea t=new Tarea(idTarea, "Hola, soy tu primera Tarea", Estado.TODO, usuario.getId());
            usuario.addTarea(t);
            DB.setUltimoIdUsuario(id);
            DB.setUltimoIdTarea(idTarea);
            try {
                DB.addUsuario(usuario);
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);
            } catch (DBException e) {
                msgErrorAlta = e.getMessage();
                valido = false;               
            }
        }//fin validacion

        // mANDAR A VISTA
        String jspAMostrar = "";
        if (valido) {
            jspAMostrar = "lista-users.jsp";
        } else {
            jspAMostrar = "createUser.jsp";
            request.setAttribute("msgErrorEmail", msgErrorEmail);
            request.setAttribute("msgErrorPwd", msgErrorPwd);
            request.setAttribute("msgErrorNombre", msgErrorNombre);
            request.setAttribute("msgErrorApellidos", msgErrorApellidos);
            request.setAttribute("msgErrorAlta", msgErrorAlta);
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(jspAMostrar);
        rd.forward(request, response);

    }

}
