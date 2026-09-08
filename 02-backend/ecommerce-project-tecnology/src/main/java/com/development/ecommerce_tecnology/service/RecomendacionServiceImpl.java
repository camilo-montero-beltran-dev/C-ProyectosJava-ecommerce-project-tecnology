package com.development.ecommerce_tecnology.service;

import com.development.ecommerce_tecnology.dao.ProductoRepository;
import com.development.ecommerce_tecnology.entity.Producto;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecomendacionServiceImpl implements RecomendacionService{

    private final ProductoRepository productoRepository;

    public RecomendacionServiceImpl(ProductoRepository productoRepository) {
        this.productoRepository = productoRepository;
    }

    @Override
    // Recomendar para ficha de producto
    public List<Producto> recomendarPorProducto(Long idProducto, int limite) {
        Producto producto = productoRepository.findById(idProducto)
                .orElseThrow(() -> new RuntimeException("Producto no encontrado"));

        return productoRepository.recomendarPorCategoria(
                producto.getCategoria().getIdCategoria(),
                producto.getIdProducto(),
                PageRequest.of(0, limite)
        ).getContent();
    }

    // Recomendar para ficha de producto
    public List<Producto> recomendadosHome(int limite , Pageable pageable){
        return productoRepository.findByActivoTrueAndStockGreaterThan(0, pageable)
                .getContent();

    }


}
