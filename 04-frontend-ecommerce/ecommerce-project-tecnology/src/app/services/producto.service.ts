import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '../environments/environment';
import { Observable } from 'rxjs';
import { ProductoAdapter } from '../models/producto-adapter';


// Marca esta clase como inyectable y disponible  globalmente (singleton)
@Injectable({
  providedIn: 'root' // Angular creara una unica intancia disponible en todas la aplicacion

})

export class ProductoService {

// Url base del backend para acceder a los endpoints relacionados por el producto 

private apiUrl = (`${environment.backendUrl}/productos`);


// Inyecciòn del servicio HttpCliente para poder realizar peticiones Http(GET, POST,PUT, DELETE)
// Inyecciòn del adapter ProductoAdapter para transformar/ mapear la data recibida  desde la API
// Y adaptarla al modelo de dominio de la aplicación  
constructor(private http: HttpClient,
            public adapter: ProductoAdapter

  ){}

  

  // Metodos para obtener todos los productos paginados del backend
  obtenerProductosPaginados(page: number =0, size: number = 20): Observable<any>{
    return this.http.get(`${this.apiUrl}/productosPaginados?page=${page}&size=${size}`)
  }

  obteneProductosCategoriaPginados(idCategoria: number, page: number = 0, size:number = 10 ): Observable<any>{
    return this.http.get(`${this.apiUrl}/productosPaginadosCategoria/${idCategoria}?page=${page}&size=${size}`)
  }
}
