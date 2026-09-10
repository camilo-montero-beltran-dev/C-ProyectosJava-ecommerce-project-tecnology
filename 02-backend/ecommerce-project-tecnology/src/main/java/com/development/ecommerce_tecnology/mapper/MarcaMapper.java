package com.development.ecommerce_tecnology.mapper;

import com.development.ecommerce_tecnology.dto.ImagenDto;
import com.development.ecommerce_tecnology.dto.MarcaDto;
import com.development.ecommerce_tecnology.entity.Imagen;
import com.development.ecommerce_tecnology.entity.Marca;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class MarcaMapper {


    // Logger para registrar eventos importantes o advertencias
    private static final Logger logger = LoggerFactory.getLogger(MarcaMapper.class);

    /**
     * Metódo principal del mapper. convierte un objeto a marcaDto
     * incluyendo imagenes asociadas a la marca
     *
     * @param imagenesMarcaDto  Mapa de ID de marca a lista de imágenes de la marca

     */
    public MarcaDto mappearMarcaDto(Marca marca,
                                          Map<Long, List<Imagen>> imagenesMarcaDto){

        // Crear nuevo DTO vacio
        MarcaDto marcaDto = new MarcaDto();

        // Copiar atributos basicos del producto// Copiar atibutos basicos del producto
        marcaDto.setIdMarca(marca.getIdMarca());
        marcaDto.setNombreMarca(marca.getNombreMarca());
        marcaDto.setDescripcion(marca.getDescripcion());


        // Procesar imàgenes propias del producto
        Long idMarca = marca.getIdMarca();
        marcaDto.setImagenesMarca(imagenesMarcaDto.getOrDefault(idMarca, List.of())
                .stream().map(ImagenDto::new).toList());

        // Devolver el DTO completamente armado
        return marcaDto;

    }
}
