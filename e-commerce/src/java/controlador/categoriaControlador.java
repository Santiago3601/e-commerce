/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import facade.*;
import entidades.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.http.Part;

/**
 *
 * @author Santiago
 */
@Named(value = "categoriaControlador")
@SessionScoped
public class categoriaControlador implements Serializable {

    private Part file;
    private String nombre;
    private String pathReal;

    @EJB
    private CategoriaFacade categoriaFacade;
    Categoria categoria;

    @PostConstruct
    public void init() {
        categoria = new Categoria();

    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Part getFile() {
        return file;
    }

    public void setFile(Part file) {
        this.file = file;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPathReal() {
        return pathReal;
    }

    public void setPathReal(String pathReal) {
        this.pathReal = pathReal;
    }

    public String crearCategoria() {
//--1-- : PARA NETBEANS ES  'CARPETA DE ARCHIVOS'
//--2-- : PARA NETBEANS ES  '\\build'
//--3-- : PARA NETBEANS ES  '\\web\\........CARPETA_CONTENEDORA_DE_ARCHIVOS'

        String path = FacesContext.getCurrentInstance().getExternalContext().getRealPath("resources\\img\\");
        path = path.substring(0, path.indexOf("\\build"));
        path = path + "\\web\\resources\\img\\";
        try {
            this.nombre = file.getSubmittedFileName();
            pathReal = "../../resources/img" + nombre;
            path = path + this.nombre;
            InputStream in = file.getInputStream();

            byte[] data = new byte[in.available()];
            in.read(data);
            FileOutputStream out = new FileOutputStream(new File(path));
            out.write(data);
            in.close();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.categoria.setFoto(pathReal);
        categoriaFacade.create(categoria);
        categoria = new Categoria();

        return "ok";

    }
    

    /**
     * Creates a new instance of categoriaControlador
     */
    public categoriaControlador() {
    }

    public List<Categoria> consultarTodos() {
        return categoriaFacade.findAll();
    }

}
