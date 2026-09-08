import { Imagen } from "./imagen";

export interface Categoria {

    idCategoria : number;
    
    nombreCategoria : string;

    descripcionCategoria : string;

    prefijoCategoria : string;

    imagenesCategoria : Imagen[];


}