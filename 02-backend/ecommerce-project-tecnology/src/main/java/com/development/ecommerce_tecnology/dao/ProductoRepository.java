package com.development.ecommerce_tecnology.dao;

import com.development.ecommerce_tecnology.dto.ProductoDto;
import com.development.ecommerce_tecnology.entity.Producto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Long> {

    // Métodos de búsqueda
    Page<Producto> findByCategoria_IdCategoria(long idCategoria , Pageable pageable);

    // Productos visibles en la tienda
    Page<Producto> findByActivoTrueAndStockGreaterThan(Integer stock, Pageable pageable);

    // Recomendados por combinación (misma categoria)
    @Query("SELECT (p) FROM Producto p WHERE p.categoria.idCategoria = :categoiaId AND p.idProducto <>: productoId AND p.activo = true AND p.stock > 0  ORDER BY p.fechaRegistro DESC ")

    Page<Producto> recomendarPorCategoria(
      @Param("categoriaId") Long categoriaId,
      @Param("productoId") Long productoId,
      Pageable pageable
    );

    List<Producto> findByCodigoProductoContainingIgnoreCaseOrNombreProductoContainingIgnoreCase(
            String codigoProducto ,String nombreProducto);

    // __ Contar productos para incrementar codigo producto
    @Query("SELECT COUNT(p) FROM Producto p WHERE p.categoria.idCategoria = :idCategoria")
    Long contarPorCategoria(@Param("idCategoria")Long idCategoria);
}

