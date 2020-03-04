/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.*;
import facade.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.context.FacesContext;
import javax.servlet.http.Part;

/**
 *
 * @author Santiago
 */
@Named(value = "productoControlador")
@SessionScoped
public class productoControlador implements Serializable {

    private int productoID;
    private List<Object[]> list;
    private List<Producto> listP;
    private Part file1;
    private String nombre1;
    private String pathReal1;
    private Part file2;
    private String nombre2;
    private String pathReal2;
    private Part file3;
    private String nombre3;
    private String pathReal3;

    @EJB
    private ProductoFacade productoFacade;
    Producto producto;
    @EJB
    private CategoriaFacade categoriaFacade;
    Categoria categoria;

    @PostConstruct
    public void init() {
        producto = new Producto();
        categoria = new Categoria();

    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public List<Object[]> getList() {
        return list;
    }

    public void setList(List<Object[]> list) {
        this.list = list;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public List<Producto> getListP() {
        return listP;
    }

    public void setListP(List<Producto> listP) {
        this.listP = listP;
    }

    public String pro(int x) {
        this.productoID = x;
        return "index2?faces-redirect=true";

    }

    public Part getFile1() {
        return file1;
    }

    public void setFile1(Part file1) {
        this.file1 = file1;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getPathReal1() {
        return pathReal1;
    }

    public void setPathReal1(String pathReal1) {
        this.pathReal1 = pathReal1;
    }

    public Part getFile2() {
        return file2;
    }

    public void setFile2(Part file2) {
        this.file2 = file2;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getPathReal2() {
        return pathReal2;
    }

    public void setPathReal2(String pathReal2) {
        this.pathReal2 = pathReal2;
    }

    public Part getFile3() {
        return file3;
    }

    public void setFile3(Part file3) {
        this.file3 = file3;
    }

    public String getNombre3() {
        return nombre3;
    }

    public void setNombre3(String nombre3) {
        this.nombre3 = nombre3;
    }

    public String getPathReal3() {
        return pathReal3;
    }

    public void setPathReal3(String pathReal3) {
        this.pathReal3 = pathReal3;
    }

    /**
     * Creates a new instance of productoControlador
     */
    public productoControlador() {
    }

    public String guardar() {
        //--1-- : PARA NETBEANS ES  'CARPETA DE ARCHIVOS'
//--2-- : PARA NETBEANS ES  '\\build'
//--3-- : PARA NETBEANS ES  '\\web\\........CARPETA_CONTENEDORA_DE_ARCHIVOS'

        String path1 = FacesContext.getCurrentInstance().getExternalContext().getRealPath("resources\\img\\");

        path1 = path1.substring(0, path1.indexOf("\\build"));
        path1 = path1 + "\\web\\resources\\img\\";
        String path2 = path1, path3 = path1;
        try {
            this.nombre1 = file1.getSubmittedFileName();
            this.nombre2 = file2.getSubmittedFileName();
            this.nombre3 = file3.getSubmittedFileName();
            pathReal1 = "../resources/img" + nombre1;
            pathReal2 = "../resources/img" + nombre2;
            pathReal3 = "../resources/img" + nombre3;
            path1 = path1 + this.nombre1;
            path2 = path2 + this.nombre2;
            path3 = path3 + this.nombre3;
            InputStream in1 = file1.getInputStream();
            InputStream in2 = file2.getInputStream();
            InputStream in3 = file3.getInputStream();

            byte[] data1 = new byte[in1.available()];
            byte[] data2 = new byte[in2.available()];
            byte[] data3 = new byte[in3.available()];
            in1.read(data1);
            in2.read(data2);
            in3.read(data3);
            FileOutputStream out1 = new FileOutputStream(new File(path1));
            FileOutputStream out2 = new FileOutputStream(new File(path2));
            FileOutputStream out3 = new FileOutputStream(new File(path3));
            out1.write(data1);
            out2.write(data2);
            out3.write(data3);
            in1.close();
            in2.close();
            in3.close();
            out1.close();
            out2.close();
            out3.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.producto.setFotoUno(pathReal1);
        this.producto.setFotoDos(pathReal2);
        this.producto.setFotoTres(pathReal3);
        this.producto.setCategoria(categoriaFacade.find(categoria.getIdCategoria()));
        
        productoFacade.create(producto);
        producto = new Producto();

        return "ok";

    }

    public List<Producto> consultarTodos() {
        return productoFacade.findAll();
    }

    public List<Object[]> consultarPorID() {
        list = productoFacade.traerProducto(this.productoID);
        return list;
    }
}
