import { Injectable } from "@angular/core";
import { Producto } from "./producto";
import { Adapter } from "./adapter";

// Marca esta clase como un servicio inyectable en Angular
@Injectable({
    // Hace que el servivio sea singletos y este disponible en toda la aplicacion
    providedIn: 'root'
})

// Implementa el patrón Adapter para tranformar datos externos en un producto
export class ProductoAdapter implements Adapter<Producto> {
    
    // Metodo que adapta (Tranforma) un objeto crudo (generalmente backend) al modelo producto que usa el frontend
    adapt(item: any): Producto {
        return {
            // Propiedad principal del producto
            idProducto: item.idProducto,
            codigoProducto: item.codigoProducto,
            nombreProducto: item.nombreProducto,
            descripcion: item.descripcion,
            precio: item.precio,
            fechaRegistro: item.fechaRegistro,
            fechaActualizacion: item.fechaActualizacion,
            stock: item.stock,
            imagenesProducto: item.imagenesProducto,
            // Objeto anidado: categoria del producto
            categoria: {
                idCategoria: item.idCategoria,
                nombreCategoria: item.nombreCategoria,
                descripcionCategoria: item.descripcionCategoria,
                prefijoCategoria: item.prefijoCategoria,
                imagenesCategoria: item.imagenesCategoria
            },
             // Objeto anidado: marca del producto
            marca: {
                idMarca: item.idMarca,
                nombreMarca: item.nombreMarca,
                imagenesMarca: item.imagenesMarca

            }
        };

    }
}


