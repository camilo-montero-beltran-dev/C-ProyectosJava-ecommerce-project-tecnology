import { HttpClient } from "@angular/common/http";

import { Injectable } from "@angular/core";
import { map, Observable } from "rxjs";
import { Marca } from "../models/marca";
import { environment } from "../../environments/environment";
import { MarcaAdapter } from "../models/marca-adapter";



@Injectable ({
    providedIn : 'root'
})

export class MarcaService{

    // Url base del backend para acceder a los endpoints relacionados con a la marca
    private apiUrl = (`${environment.backendUrl}/marcas`);


    // inyeccion del servicio HttpClient para poder realizar peticiones HTTP
    constructor (private http: HttpClient,
                 public adapter: MarcaAdapter
    ){}

    // Metodo para obtener todas las marcas del backend
    obtenerMarcas(): Observable<Marca[]>{
        return this.http.get<any[]>(this.apiUrl).pipe(
            map(data => data.map(item => this.adapter.adapt(item)))
        )
    }

    // Mètodo para obtener todas las marcas paginadas del backend
    obtenerMarcasPaginadas(page: number = 0, size:number = 20): Observable<any> {
    return this.http.get(`${this.apiUrl}/marcasPaginadas?page=${page}&size=${size}`)
    }


    // Metodo parta crear una nueva marca en el backend
    crearMarca(marca:any): Observable <any> {
        return this.http.post<Marca>(`${this.apiUrl}/crearMarca`,marca);

    }
}