import { Component, Inject, OnInit, PLATFORM_ID } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { CategoriaService } from '../../../services/categoria.service';
import { RouterModule } from '@angular/router';

export interface Categoria {
imagenesCategoria: any;
  idCategoria: number;
  nombreCategoria: string;
  descripcion?: string;
  prefijoCategoria?:string;
}




@Component({
  selector: 'app-lista-categoria',
  standalone: true,
  imports: [CommonModule, RouterModule, FormsModule],
  templateUrl: './lista-categoria.component.html',
  styleUrls: ['./lista-categoria.component.css']
})

 export class ListaCategoriaComponent implements OnInit {

  categorias : Categoria[]=[];
  categoriaAEliminar: any=null;
  mostrarModal: boolean = false;
  isBrowser: boolean;

  paginaActual = 0;
  tamanioPagina = 10;
  totalPaginas = 0;

  //Inyeccion de dependencias
   constructor(

    private categoriaService : CategoriaService,
    @Inject(PLATFORM_ID) private plarformId:Object
   ){

    // Detecta si esmaos en navegador o SSR
     this.isBrowser = isPlatformBrowser(this.plarformId)
   }

  // Metodo del ciclo de vida: se ejecuta al inicializar el componente
   ngOnInit(): void {
    this.cargarDatos();// Carga inicial de datos
   }


cargarDatos():void{ 
  
  // Carga categorias 
      this.categoriaService.obtenerCategoriasPaginadas(this.paginaActual, 
        this.tamanioPagina).subscribe({ 
          next: (response) => { 
            console.log("Paginas recibidas", response) 
            this.categorias = response.content.map((item: any) => 
              this.categoriaService.adapter.adapt(item) 
          ); 
          this.totalPaginas = response.totalPages; }, 
          error: (err) => console.error('error cargando categorias:', err) });
  }

  confirmarEliminar(categoria:   Categoria) : void {
    
    
            console.log('categoria seleccionada para eliminar', categoria);
            console.log('ID:', categoria.idCategoria);
    
            this.categoriaAEliminar = categoria;
            this.mostrarModal = true;
        }
    
  
  eliminarCategoria(idCategoria: number): void {
      this.categorias = this.categorias.filter(categoria => categoria.idCategoria !== idCategoria);
    }
  
        cambiarPagina(nuevaPagina: number) {
          if (nuevaPagina >= 0 && nuevaPagina < this.totalPaginas) {
              this.paginaActual = nuevaPagina;
              this.cargarDatos()
          }
      }

 }


