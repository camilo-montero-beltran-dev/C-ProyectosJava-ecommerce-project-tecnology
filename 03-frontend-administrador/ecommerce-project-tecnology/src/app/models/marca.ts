import { Imagen } from "./imagen";

export interface Marca{

    idMarca : number;

    nombreMarca : String;

    descripcion : String;

    imagenesMarca? : Imagen[];

}