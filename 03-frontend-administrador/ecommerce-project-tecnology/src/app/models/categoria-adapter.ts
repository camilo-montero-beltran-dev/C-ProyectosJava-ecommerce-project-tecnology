import { Injectable } from "@angular/core";
import { Adapter } from "./adapter";
import { Categoria } from "./categoria";

// Categoria esta clase como un servicio inyectable en Angular
@Injectable({
// Hace que el servivio sea singletos y este disponible en toda la aplicacion
    providedIn: 'root'
})

// Implementa el patrón Adapter para tranformar datos externos en un producto
export class CategoriaAdapter implements Adapter<Categoria>{
        adapt(item: any): Categoria {
        return {
            
            idCategoria : item.idCategoria,
            nombreCategoria : item.nombreCategoria,
            descripcion : item.descripcion,
            prefijoCategoria : item.prefijoCategoria,
            imagenesCategoria : item.imagenesCategoria,

        };
    }
}

