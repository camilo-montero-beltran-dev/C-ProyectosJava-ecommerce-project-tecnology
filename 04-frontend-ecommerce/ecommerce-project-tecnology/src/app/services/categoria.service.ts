import { Injectable } from '@angular/core';
import { environment } from '../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Categoria } from '../models/categoria';


// Marca esta clase como inyectable y disponible globalmente (singleton)
@Injectable({
  providedIn: 'root' /// Angular creara una unica instancia disponible a todas las aplicaciones
}) 


export class CategoriaService {


  // Url base del backend para acceder a los endpoints relacionados por la cactegoria


  private apiUrl =(`${environment.backendUrl}/categorias`)


  // Inyecciòn del servicio HttpCliente para poder realizar peticiones Http(GET, POST,PUT, DELETE)
  constructor(
    private http: HttpClient
  ) { }

  // Metodo para obtener todas las categorias del backend
  obtenerCategorias(): Observable<Categoria[]>{
    return this.http.get<Categoria[]>(this.apiUrl);
  };

}
