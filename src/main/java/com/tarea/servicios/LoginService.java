/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tarea.servicios;

import com.tarea.dominio.*;
import com.tarea.excepcion.LoginException;
import java.util.Collection;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoginService {
    public void login(String email, String clave, HttpSession sesion) throws LoginException {
        //DB ver si existe y coincide email y clave

        Collection<Usuario> usuarios = DB.getListaUsuario();
        Usuario usrEncontrado = null;
        for (Usuario u : usuarios) {
            if (u.getEmail().equals(email)) {
                usrEncontrado = u;
                break;
            }
        }
        //sino existe lanzo excepcion 
        if (usrEncontrado == null) {
            throw new LoginException("El usuario no existe. Debe registrarse.");
        }else{
            //ver si clave ok
            if(usrEncontrado.getPassword().equals(clave)){
                //añadir a sesion
                sesion.setAttribute("usuario", usrEncontrado);
            }else{
                throw new LoginException("Clave no válida");
            }
        }
        
    }//fin login

    public void logout(HttpSession sesion) {
        sesion.invalidate();
    }//fin logout
}
