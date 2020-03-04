/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

//import entidades.RolTienePermiso;
import entidades.*;
import facade.*;
import facade.UsuarioFacade;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;

/**
 *
 * @author Aprendiz
 */
@Named(value = "usuarioControlador")
@SessionScoped
public class usuarioControlador implements Serializable {

    @EJB
    UsuarioFacade usuarioFacade;
    Usuario usuario;
    Usuario usuarioLogueado;
    Categoria categoria;

    @PostConstruct
    public void init() {
        usuario = new Usuario();
        categoria = new Categoria();

    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public usuarioControlador() {
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

//METODOS
    public String SingUp() {
        usuario.setRol(2);
        usuarioFacade.create(usuario);
        return "usuario_registrado";
    }

    public Usuario getUsuarioLogueado() {
        return usuarioLogueado;
    }

    public void setUsuarioLogueado(Usuario usuarioLogueado) {
        this.usuarioLogueado = usuarioLogueado;
    }

    public String validarLogin() {
        String redirecionar = "";
        try {
            usuarioLogueado = usuarioFacade.login(usuario);
            if (usuarioLogueado != null) {
                int rol = usuarioLogueado.getRol();

                System.out.println("usuarioLogeado " + usuarioLogueado.getNombre());
                FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("sesionLogin", usuarioLogueado);
                switch (usuarioLogueado.getRol()) {
                    case 1:
                        redirecionar = "dashboard/admin/index?faces-redirect=true";
                        break;
                    case 2:
                        redirecionar = "dashboard/usuario/index?faces-redirect=true";
                        break;

                    default:
                        throw new AssertionError();
                }

            } else {
                redirecionar = "index";

            }

        } catch (Exception e) {
            System.out.println("Error" + e.getMessage());
        }

        return redirecionar;
    }

}
