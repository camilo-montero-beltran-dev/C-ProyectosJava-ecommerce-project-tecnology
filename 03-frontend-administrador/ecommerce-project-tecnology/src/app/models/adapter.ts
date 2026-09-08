// Interfaz  generíca Adapter
// Define un contrato para transforma (adappter) un objeto
// desde cualquier fuente (normalmente un backend)
// hacia un moodelo especifico del fronend


export interface Adapter<T>{


//Método que recibe un objeto sin tipar (item),
// generalmente proveniente de una API o fuente externa,
// y lo transforma en un objeto del tipo T

  adapt(item: any): T;
}
