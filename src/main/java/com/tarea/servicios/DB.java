/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tarea.servicios;

import com.tarea.dominio.*;
import java.util.ArrayList;

/**
 *
 * @author user
 */
public class DB {
    private static ArrayList<Usuario> listaUsuario;
    private static int ultimoIdTarea=0;

    public static int getUltimoIdTarea() {
        return ultimoIdTarea;
    }

    public static void setUltimoIdTarea(int ultimoIdTarea) {
        DB.ultimoIdTarea = ultimoIdTarea;
    }
    
    //*********************************************************
    
    //Get user del listado de usuarios por su id
    
    public static synchronized Usuario getUser(int id){
        Usuario user=null;
        for (int i = 0; i < 10; i++) {
            
        }
        return user;
    }
    
    
    
    
    //Get all Tareas un usuario
    
    static{
        listaUsuario=new ArrayList<Usuario>();
        listaUsuario.add(new Usuario(1,"a@ruiz.es","1","adrian","ruiz"));
        listaUsuario.add(new Usuario(2,"ton@ton.es","1","ser","top"));
        listaUsuario.add(new Usuario(3,"ser@serz.es","1","ru","ghuo"));
        
        //Añado a cada usuario dos tareas
        listaUsuario.get(0).addTarea(new Tarea(++ultimoIdTarea, "Application JAVA", Estado.TODO, listaUsuario.get(0).getId()));
        listaUsuario.get(0).addTarea(new Tarea(++ultimoIdTarea, "Application MVC con conexion DB", Estado.TODO, listaUsuario.get(0).getId()));
        listaUsuario.get(0).addTarea(new Tarea(++ultimoIdTarea, "Leer a Escohotado", Estado.INPROGRESS, listaUsuario.get(0).getId()));
        listaUsuario.get(0).addTarea(new Tarea(++ultimoIdTarea, "Hacer la compra de navidad", Estado.INPROGRESS, listaUsuario.get(0).getId()));
        listaUsuario.get(1).addTarea(new Tarea(++ultimoIdTarea, "Levantar pesas", Estado.TODO, listaUsuario.get(1).getId()));
        listaUsuario.get(1).addTarea(new Tarea(++ultimoIdTarea, "Comer pollo y arroz", Estado.TODO, listaUsuario.get(1).getId()));
        listaUsuario.get(2).addTarea(new Tarea(++ultimoIdTarea, "Import-Export", Estado.TODO, listaUsuario.get(2).getId()));
        listaUsuario.get(2).addTarea(new Tarea(++ultimoIdTarea, "Leer el quijote", Estado.TODO, listaUsuario.get(2).getId()));
        
    }
}
