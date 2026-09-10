package com.development.ecommerce_tecnology.service;

import com.development.ecommerce_tecnology.dto.CategoriaCrearDto;
import com.development.ecommerce_tecnology.dto.CategoriaDto;
import com.development.ecommerce_tecnology.entity.Categoria;
import org.springframework.data.domain.Page;

import org.springframework.data.domain.Pageable;
import java.io.IOException;
import java.util.List;

public interface CategoriaService {

    Categoria obtenerCategoriaPorId(Long idCategoria);

    CategoriaDto obtenerCategoriaConImagenes(Long idCategoria);

    List<CategoriaDto> obtenerTodasCategoriasConImagenes();

    Page<CategoriaDto> obtenerTodasCategoriaConImagenesPaginadas(Pageable pageable);

    CategoriaDto crearCategoriaConImagen(CategoriaCrearDto categoriaCrearDto)throws IOException;

    void eliminarCategoria (Long idCategoria);

    String obtenerPrefijoCategoria(Long idCategoria);



}

