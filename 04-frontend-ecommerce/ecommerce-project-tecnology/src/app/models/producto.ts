import { Categoria } from "./categoria";
import { Imagen } from "./imagen";
import { Marca } from "./marca";

export interface Producto{

    idProducto? : number;
    codigoProducto: string;
    nombreProducto : string;
    descripcion: string;
    precio: number;
    fechaRegistro: Date;
    fechaActualizacion: Date;
    stock: number;
    imagenesProducto?: Imagen[];

    categoria: Categoria;
    marca: Marca;
}