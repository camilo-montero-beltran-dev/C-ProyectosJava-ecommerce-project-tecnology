// Funcion que inicializa (bootstrap) una aplicacion Angular basada en componentes standlone
import { bootstrapApplication } from '@angular/platform-browser';
// Componente raiz de la aplicaciòn
import { AppComponent } from './app/app.component';
// Funciones y tipos para configurar el sistema de rutas
import { provideRouter, Routes } from '@angular/router';
// Componente que se mostrarà cuando se navegue a la ruta /listaProductos 
import { ListaProductosComponent } from './app/component/producto/lista-productos/lista-productos.component';
// Proovedor para habilitar el uso de HttpClient en tola la aplicaciòn
import { provideHttpClient } from '@angular/common/http';
import { ListaCategoriasComponent } from './app/component/categoria/lista-categorias/lista-categorias.component';
import { ListaProductosCategoriaComponent } from './app/component/lista-productos-categoria/lista-productos-categoria.component';

// Deficiciòn de arreglo de rutas disponibles a la aplicaciòn
const routes: Routes = [ // se definen las rutas disponibles en la app.

// Ruta accesible desde la URL: /listaProductos---//Componente que Angular renderiza dentro del <router-outlet>
{ path:'listaProductos' , component: ListaProductosComponent},    

{ path:'listaCategorias' ,component: ListaCategoriasComponent},  

{ path:'listaProductosCategoria/:idCategoria' , component: ListaProductosCategoriaComponent}

];

  



 // Arranque de la aplicaciòn Angular usando el componente raìz  
bootstrapApplication(AppComponent, {
  // Proveedres globales disponibles en toda la app
    providers: 
    [
      // Habilita HttpClient para realizar peticiones HTTP (GET, POST, etc) 
      provideHttpClient(),

      // Registra y habilita el sistema de rutas usando las rutas definidas arriba
     provideRouter(routes), 
    ]}
  
)
// Manejo de errores en caso de que la aplicaciòn falle al inicializar
  .catch((err) => console.error(err));
