import { CommonModule, isPlatformBrowser } from '@angular/common';
import { Component, Inject, OnInit, PLATFORM_ID } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { ProductoService } from '../../../services/producto.service';
import { Producto } from '../../../models/producto';

@Component({
  selector: 'app-lista-productos', // Selector para usar en platillas HTML
  standalone: true, // Componente autonomo (no necesita modulo padres)
  imports: [CommonModule, RouterModule, FormsModule], // Modulos reuqeridos
  templateUrl: './lista-productos.component.html',
  styleUrls: ['./lista-productos.component.scss']
})
export class ListaProductosComponent implements OnInit {

  productos: Producto[]=[];
  isBrowser: boolean;

  paginaActual = 0;
  tamanioPagina = 10;
  totalPaginas = 0;


  // Inyeccion de dependencias
  constructor(
    private productoService : ProductoService,
    @Inject(PLATFORM_ID) private platformId:Object
  ){

    // Detecta si estamos en navegador o SSR
    this.isBrowser = isPlatformBrowser(this.platformId)

  }
  
  // Metodo del ciclo de vida: se ejecuta al inicialzar el componente
  ngOnInit(): void {
    this.cargarDatos();
  }

  // Cargar todos los datos necesarios del producto
  cargarDatos(): void {
    //Cargar productos
    this.productoService.obtenerProductosPaginados(this.paginaActual , this.tamanioPagina).subscribe({
      next: (response)=> {
        console.log("Paginas recibidas", response)
        this.productos = response.content.map((item: any) => this.productoService.adapter.adapt(item));
        this.totalPaginas = response.totalpages;
      },

      error: (err) => console.error('error cargando productos:', err)
    })


  }
}
