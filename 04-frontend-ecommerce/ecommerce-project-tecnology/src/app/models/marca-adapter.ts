import { Injectable } from "@angular/core";
import { Adapter } from "./adapter";
import { Marca } from "./marca";

// Marca esta clase como un servicio inyectable en Angular
@Injectable({
// Hace que el servivio sea singletos y este disponible en toda la aplicacion
    providedIn: 'root'
})

// Implementa el patrón Adapter para tranformar datos externos en un producto
export class MarcaAdapter implements Adapter<Marca>{
    adapt(item: any): Marca {
        return {
            
            idMarca : item.idMarca,
            nombreMarca : item.nombreMarca,
            imagenesMarca : item.imagenesMarca,

        };
    }
}


