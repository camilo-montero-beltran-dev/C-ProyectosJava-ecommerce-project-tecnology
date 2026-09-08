import { CommonModule, isPlatformBrowser } from '@angular/common';
import { Component, Inject, OnInit, PLATFORM_ID } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { Producto } from '../../models/producto';
import { ProductoService } from '../../services/producto.service';
import { Categoria } from '../../models/categoria';

@Component({
  selector: 'app-lista-productos-categoria',
    imports: [CommonModule, RouterModule], // Modulos reuqeridos
  templateUrl: './lista-productos-categoria.component.html',
  styleUrl: './lista-productos-categoria.component.scss'
})
export class ListaProductosCategoriaComponent implements OnInit{
  
  productosCategoria: Producto[]=[];
  categoria!: Categoria;
  isBrowser: boolean;

  paginaActual = 0;
  tamanioPagina = 10;
  totalPaginas = 0;

  
  

  // Inyeccion de dependencias
  constructor(
    private productoService : ProductoService,
    @Inject(PLATFORM_ID) private platformId:Object,

    private route :ActivatedRoute,
  ){

    // Detecta si estamos en navegador o SSR
    this.isBrowser = isPlatformBrowser(this.platformId)

  }

    // Metodo del ciclo de vida: se ejecuta al inicialzar el componente
    ngOnInit(): void {
      this.cargarDatos();
  }


  // Cargar todos los datos necesarios del producto
  cargarDatos() {

    const idCategoria = Number(this.route.snapshot.paramMap.get('idCategoria'))
    //Cargar productos por categoria
    this.productoService.obteneProductosCategoriaPginados(idCategoria, this.paginaActual , this.tamanioPagina ).subscribe({
      next: (response)=> {
        console.log("Paginas recibidas", response)
        this.productosCategoria = response.content.map((item: any) => this.productoService.adapter.adapt(item));
        this.totalPaginas = response.totalpages;
      
      },

      error: (err) => console.error('error cargando productos:', err)
    })

  }



}
