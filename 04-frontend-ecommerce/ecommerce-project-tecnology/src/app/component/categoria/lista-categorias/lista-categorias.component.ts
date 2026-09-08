import { Component, Inject, OnInit, PLATFORM_ID } from '@angular/core';
import { Categoria } from '../../../models/categoria';
import { CategoriaService } from '../../../services/categoria.service';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-lista-categorias',
  standalone: true, // Componente autonomo (no necesita modulo padres)
  imports: [CommonModule, RouterModule], // Modulos reuqeridos
  templateUrl: './lista-categorias.component.html',
  styleUrls: ['./lista-categorias.component.scss']
})
export class ListaCategoriasComponent implements OnInit{
  categorias: Categoria[]=[]; //lista de categorias a mostrar
  isBrowser: boolean;
  
  currentIndex = 0;
  maxVisible = 5;
  itemWidth = 100 / this.maxVisible;

  // Inyeccion de pertenencias 
  constructor(
    private categoriaService : CategoriaService,
    @Inject(PLATFORM_ID) private platformId:Object
  ){
    // Detecta si estamos en navegador o SSR
    this.isBrowser = isPlatformBrowser(this.platformId) 
  }

  // Metodo del ciclo de vida: se ejecuta al inicialzar el componente
  ngOnInit(): void {
    this.cargarDatos();
  }

  // Cargar todos los datos necesarios  a la categoria
  cargarDatos() {
    // cargar categorias
    this.categoriaService.obtenerCategorias().subscribe({
      next: (categorias) => {
        console.log("Categorias recibidas desde componente categorias", categorias)
        this.categorias = categorias;
      },
      error: (err) => console.error('error cargando productos:' , err)
    })
  }

  next(){
    if(this.currentIndex < this.categorias.length - this.maxVisible)
      this.currentIndex++;
  }

  prev(){
    if (this.currentIndex > 0){
      this.currentIndex--
    }
  }


}
