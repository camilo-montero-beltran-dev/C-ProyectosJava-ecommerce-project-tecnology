import { Component } from '@angular/core';
import { Routes } from '@angular/router';
import { ListaProductosComponent } from './component/producto/lista-productos/lista-productos.component';
import { ListaCategoriasComponent } from './component/categoria/lista-categorias/lista-categorias.component';
import { ListaProductosCategoriaComponent } from './component/lista-productos-categoria/lista-productos-categoria.component';

export const routes: Routes = [

{ path:'listaProductos' , component: ListaProductosComponent},
{ path:'listaCategorias' , component: ListaCategoriasComponent},
{ path:'listaProductosCategoria/:idCategoria', component: ListaProductosCategoriaComponent} 

];
