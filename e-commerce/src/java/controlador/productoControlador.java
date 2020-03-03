/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.*;
import facade.*;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;

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

    /**
     * Creates a new instance of productoControlador
     */
    public productoControlador() {
    }

    public List<Producto> consultarTodos() {
        return productoFacade.findAll();
    }

    public List<Object[]> consultarPorID() {
        list = productoFacade.traerProducto(this.productoID);
        
        return list;
    }
}
