import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListaProductosCategoriaComponent } from './lista-productos-categoria.component';

describe('ListaProductosCategoriaComponent', () => {
  let component: ListaProductosCategoriaComponent;
  let fixture: ComponentFixture<ListaProductosCategoriaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListaProductosCategoriaComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListaProductosCategoriaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
