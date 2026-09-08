package com.development.ecommerce_tecnology.controller;

import com.development.ecommerce_tecnology.entity.Producto;
import com.development.ecommerce_tecnology.service.MovimientoInventarioRegistrarService;
import com.development.ecommerce_tecnology.service.ProductoService;
import com.development.ecommerce_tecnology.service.RecomendacionService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/admin/productos")
public class AdminProductoController {


    private final ProductoService productoService;
    private final RecomendacionService recomendacionService;

    public AdminProductoController(ProductoService productoService, MovimientoInventarioRegistrarService movimientoInventarioRegistrarService, RecomendacionService recomendacionService) {
        this.productoService = productoService;
        this.recomendacionService = recomendacionService;
    }

    @GetMapping("/productosPaginados")
    public ResponseEntity<Page<Producto>> listarProductosActivosPaginados(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            @RequestParam(defaultValue = "nombreProducto") String sortBy
    )
    {
        Pageable pageable = PageRequest.of(page, size , Sort.by("nombreProducto").ascending());
        Page<Producto>productos=productoService.obtenerTodosProductosActivosTienda(pageable);
        return ResponseEntity.ok(productos);
    }

}
