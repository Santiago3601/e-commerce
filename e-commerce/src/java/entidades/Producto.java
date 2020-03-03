/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Santiago
 */
@Entity
@Table(name = "producto")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Producto.findAll", query = "SELECT p FROM Producto p")
    , @NamedQuery(name = "Producto.findByIdProduct", query = "SELECT p FROM Producto p WHERE p.idProduct = :idProduct")
    , @NamedQuery(name = "Producto.findByNombre", query = "SELECT p FROM Producto p WHERE p.nombre = :nombre")
    , @NamedQuery(name = "Producto.findByPeso", query = "SELECT p FROM Producto p WHERE p.peso = :peso")
    , @NamedQuery(name = "Producto.findByPrecio", query = "SELECT p FROM Producto p WHERE p.precio = :precio")})
public class Producto implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "id_product")
    private Integer idProduct;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "nombre")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16383)
    @Column(name = "descripcion")
    private String descripcion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "peso")
    private int peso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "precio")
    private long precio;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16383)
    @Column(name = "foto_uno")
    private String fotoUno;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16383)
    @Column(name = "foto_dos")
    private String fotoDos;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 16383)
    @Column(name = "foto_tres")
    private String fotoTres;
    @JoinColumn(name = "categoria", referencedColumnName = "id_categoria")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Categoria categoria;

    public Producto() {
    }

    public Producto(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public Producto(Integer idProduct, String nombre, String descripcion, int peso, long precio, String fotoUno, String fotoDos, String fotoTres) {
        this.idProduct = idProduct;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.peso = peso;
        this.precio = precio;
        this.fotoUno = fotoUno;
        this.fotoDos = fotoDos;
        this.fotoTres = fotoTres;
    }

    public Integer getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Integer idProduct) {
        this.idProduct = idProduct;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPeso() {
        return peso;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public long getPrecio() {
        return precio;
    }

    public void setPrecio(long precio) {
        this.precio = precio;
    }

    public String getFotoUno() {
        return fotoUno;
    }

    public void setFotoUno(String fotoUno) {
        this.fotoUno = fotoUno;
    }

    public String getFotoDos() {
        return fotoDos;
    }

    public void setFotoDos(String fotoDos) {
        this.fotoDos = fotoDos;
    }

    public String getFotoTres() {
        return fotoTres;
    }

    public void setFotoTres(String fotoTres) {
        this.fotoTres = fotoTres;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProduct != null ? idProduct.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Producto)) {
            return false;
        }
        Producto other = (Producto) object;
        if ((this.idProduct == null && other.idProduct != null) || (this.idProduct != null && !this.idProduct.equals(other.idProduct))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidades.Producto[ idProduct=" + idProduct + " ]";
    }
    
}
