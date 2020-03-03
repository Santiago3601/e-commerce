/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import entidades.Categoria;
import entidades.Usuario;
import facade.CategoriaFacade;
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
@Named(value = "categoriaControlador")
@SessionScoped
public class categoriaControlador implements Serializable {

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




    /**
     * Creates a new instance of categoriaControlador
     */
    public categoriaControlador() {
    }
    public List<Categoria> consultarTodos() {
        return categoriaFacade.findAll();
    }


}
