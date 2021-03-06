/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import entidades.Categoria;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author Santiago
 */
@Stateless
public class CategoriaFacade extends AbstractFacade<Categoria> {

    @PersistenceContext(unitName = "e-commercePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoriaFacade() {
        super(Categoria.class);
    }

    public List<Object[]> traerCatPadreNone() {
        Query query;
        List<Object[]> listaConsulta = null;

        query = em.createNativeQuery("call selectCatByCatPadreNull()");
        query.executeUpdate();
        listaConsulta = query.getResultList();
        if (!listaConsulta.isEmpty()) {
            return listaConsulta;
        }

        return null;
    }

    public List<Object[]> traerCatPadre() {
        Query query;
        List<Object[]> listaConsulta = null;

        query = em.createNativeQuery("call selectCatByCatPadreNotNull()");
        query.executeUpdate();
        listaConsulta = query.getResultList();
        if (!listaConsulta.isEmpty()) {
            return listaConsulta;
        }

        return null;
    }
    public void insertCatPadre(int x) {
        Query query;
        query = em.createNativeQuery("call selectCatByCatPadreNotNull()");
        query.executeUpdate();
      
       
    }

}
