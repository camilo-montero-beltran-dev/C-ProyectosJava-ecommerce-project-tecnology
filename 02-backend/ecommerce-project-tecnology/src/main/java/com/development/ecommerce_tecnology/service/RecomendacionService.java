package com.development.ecommerce_tecnology.service;


import com.development.ecommerce_tecnology.entity.Producto;

import org.springframework.data.domain.Pageable;


import java.util.List;


public interface RecomendacionService {

     List<Producto> recomendarPorProducto(Long idProducto, int limite);
     public List<Producto> recomendadosHome(int limite , Pageable pageable);
}
