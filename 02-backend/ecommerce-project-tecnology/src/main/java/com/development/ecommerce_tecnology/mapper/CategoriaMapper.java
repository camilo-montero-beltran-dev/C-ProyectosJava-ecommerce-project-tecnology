package com.development.ecommerce_tecnology.mapper;

import com.development.ecommerce_tecnology.dto.CategoriaDto;
import com.development.ecommerce_tecnology.dto.ImagenDto;
import com.development.ecommerce_tecnology.entity.Categoria;
import com.development.ecommerce_tecnology.entity.Imagen;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class CategoriaMapper {

    // Logger para registrar eventos importantes o advertencias
    private static final Logger logger = LoggerFactory.getLogger(CategoriaMapper.class);

    /**
     * Metódo principal del mapper. convierte un objeto a categoriaDto
     * incluyendo imagenes asociadas a la categoria
     *
     * @param imagenesCategoriaDto  Mapa de ID de categoria a lista de imágenes de la categoria

     */
    public CategoriaDto mappearCategoriaDto(Categoria categoria,
                                            Map<Long, List<Imagen>> imagenesCategoriaDto){

        // Crear nuevo DTO vacio
        CategoriaDto categoriaDto = new CategoriaDto();

        // Copiar atributos basicos del producto// Copiar atibutos basicos del categoria
        categoriaDto.setIdCategoria(categoria.getIdCategoria());
        categoriaDto.setNombreCategoria(categoria.getNombreCategoria());
        categoriaDto.setDescripcion(categoria.getDescripcion());
        categoriaDto.setPrefijoCategoria(categoria.getPrefijoCategoria());


        // Procesar imàgenes propias del categoria
        Long idCategoria = categoria.getIdCategoria();
        categoriaDto.setImagenesCategoria(imagenesCategoriaDto.getOrDefault(idCategoria, List.of())
                .stream().map(ImagenDto::new).toList());

        // Devolver el DTO completamente armado
        return categoriaDto;

    }
}
