import { Imagen } from "./imagen";

export interface Categoria{

    idCategoria : number;

    nombreCategoria : string;
    
    descripcion :String;

    prefijoCategoria : string;

    imagenesCategoria? : Imagen[];



}

