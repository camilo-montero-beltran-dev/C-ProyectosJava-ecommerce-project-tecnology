package com.development.ecommerce_tecnology.dao;

import com.development.ecommerce_tecnology.entity.Categoria;
import com.development.ecommerce_tecnology.entity.Producto;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;



@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {


    // Page<Producto> findByIdCategoria;

    @Query("SELECT c.prefijoCategoria FROM Categoria c WHERE c.idCategoria = :idCategoria")
    String obtenerPrefijoPorId (@Param("idCategoria") Long idCategoria);

}
