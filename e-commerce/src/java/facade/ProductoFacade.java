/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package facade;

import entidades.Producto;
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
public class ProductoFacade extends AbstractFacade<Producto> {

    @PersistenceContext(unitName = "e-commercePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductoFacade() {
        super(Producto.class);
    }

    public List<Object[]> traerProducto(int x) {
        Query query;
        List<Object[]> listaConsulta = null;
    
            query = em.createNativeQuery("call selectbycat(?1)");
            query.setParameter(1, x);
            query.executeUpdate();
            listaConsulta = query.getResultList();
            if (!listaConsulta.isEmpty()) {
                return listaConsulta;
            }
 
        return null;
    }
    
    
    

}
