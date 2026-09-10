import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { Categoria } from "../models/categoria";
import { environment } from "../../environments/environment";
import { CategoriaAdapter } from "../models/categoria-adapter";



@Injectable({
    providedIn : 'root'
})

export class CategoriaService{

   // Url base del backend para acceder a los endpoints relacionados con a la marca
   private apiUrl = (`${environment.backendUrl}/categorias`);
   

    // inyeccion del servicio HttpClient para poder realizar peticiones HTTP
    constructor (private http: HttpClient,
                 public adapter: CategoriaAdapter
    ){}


   // Mètodo para obtener todas las categorias del backend
   obtenerCategorias(): Observable<Categoria[]>{
      return this.http.get<Categoria[]>(this.apiUrl);
 }

   // Mètodo para obtener todas las categorias paginadas del backend
    obtenerCategoriasPaginadas(page: number = 0, size:number = 20): Observable<any> {
    return this.http.get(`${this.apiUrl}/categoriaPaginadas?page=${page}&size=${size}`)
    }



 // Metodo para crear una nueva categoria en el backend
 crearCategoria(categoria: any): Observable <any>{
    return this.http.post<Categoria>(`${this.apiUrl}/crearCategoria`,categoria);
 }
}

