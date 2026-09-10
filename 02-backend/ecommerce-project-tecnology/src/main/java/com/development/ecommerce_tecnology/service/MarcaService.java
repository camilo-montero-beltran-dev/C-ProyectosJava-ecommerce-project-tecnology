package com.development.ecommerce_tecnology.service;

import com.development.ecommerce_tecnology.dto.MarcaCrearDto;
import com.development.ecommerce_tecnology.dto.MarcaDto;
import com.development.ecommerce_tecnology.dto.ProductoDto;
import com.development.ecommerce_tecnology.entity.Marca;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.util.List;

public interface MarcaService {

    Marca obtenerMarcaPorId(Long idMarca);

    MarcaDto obtenerMarcaConImagenes(Long idMarca);

    List<MarcaDto> obtenerTodasMarcasConImagenes();

    Page<MarcaDto> obtenerTodasMarcasConImagenesPaginadas(Pageable pageable);

    MarcaDto crearMarcaConImagen(MarcaCrearDto marcaCrearDto)throws IOException;

    void eliminarMarca (Long idMarca);
}
