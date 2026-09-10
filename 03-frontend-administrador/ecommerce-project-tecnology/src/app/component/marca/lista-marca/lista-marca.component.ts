import { Component, Inject, OnInit, PLATFORM_ID } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { MarcaService } from '../../../services/marca.service';

export interface Marca {
  imagenesMarca: any;
  idMarca: number;
  nombreMarca: string;
  descripcion?: string;
}

@Component({
  selector: 'app-lista-marca', //Selector para usar en plantillas HTML
  standalone: true, // Componente autonomo (no necesita modulo padre)
  imports: [CommonModule, RouterModule, FormsModule], //Modulos requeridos
  templateUrl: './lista-marca.component.html', //plantilla asociada
  styleUrls: ['./lista-marca.component.css'] //Estilo CSS
})


export class ListaMarcaComponent implements OnInit {
  marcas: Marca[] = []; // Lista de marcas a mostrar
  marcaAEliminar: any=null; // producto seleccionado para eliminar
  mostrarModal: boolean = false;
  isBrowser: boolean;

  paginaActual = 0;
  tamanioPagina = 10;
  totalPaginas = 0;

  //Inyeccion de dependencias
  constructor(
    private marcaService : MarcaService,
    @Inject(PLATFORM_ID) private plarformId:Object
  ) {

    // Detecta si esmaos en navegador o SSR
     this.isBrowser = isPlatformBrowser(this.plarformId)

  }

  // Metodo del ciclo de vida: se ejecuta al inicializar el componente
  ngOnInit(): void {
    this.cargarDatos();// Carga inicial de datos
  }

// Carga todos los datos necesarios de marca 
  
cargarDatos():void{ 
  
  // Carga marcas 
      this.marcaService.obtenerMarcasPaginadas(this.paginaActual, 
        this.tamanioPagina).subscribe({ 
          next: (response) => { 
            console.log("Paginas recibidas", response) 
            this.marcas = response.content.map((item: any) => 
              this.marcaService.adapter.adapt(item) 
          ); 
          this.totalPaginas = response.totalPages; }, 
          error: (err) => console.error('error cargando marcas:', err) });
   
    
  }

      confirmarEliminar(marca:   Marca) : void {
  
  
          console.log('marca seleccionada para eliminar', marca);
          console.log('ID:', marca.idMarca);
  
          this.marcaAEliminar = marca;
          this.mostrarModal = true;
      }
  

  eliminarMarca(idMarca: number): void {
    this.marcas = this.marcas.filter(marca => marca.idMarca !== idMarca);
  }

      cambiarPagina(nuevaPagina: number) {
        if (nuevaPagina >= 0 && nuevaPagina < this.totalPaginas) {
            this.paginaActual = nuevaPagina;
            this.cargarDatos()
        }
    }


}
