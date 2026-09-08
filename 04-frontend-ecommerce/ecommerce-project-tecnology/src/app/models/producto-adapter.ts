import { Injectable } from "@angular/core";
import { Producto } from "./producto";
import { Adapter } from "./adapter";


@Injectable({
    providedIn: 'root'
})

export class ProductoAdapter implements Adapter<Producto>{
    
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
            //Objeto anidado: categoria del producto
            categoria:{
                idCategoria: item.idCategoria,
                nombreCategoria: item.nombreCategoria,
                descripcionCategoria: item.descripcion,
                prefijoCategoria: item.prefijoCategoria,
                imagenesCategoria: item.imagenesCategoria
            },
            // Objeto aninado: marca del producto
            marca:{
                idMarca: item.idMarca,
                nombreMarca: item.nombreCategoria,
                imagenesMarca: item.imagenesMarca
            }

        }



    }
}