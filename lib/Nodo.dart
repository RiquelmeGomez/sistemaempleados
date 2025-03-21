// Clase Nodo: Representa un nodo en el árbol binario.
import 'package:sistemaempleados/Empleado.dart'; // Importa la clase Empleado para utilizarla en los nodos.

class Nodo {
  Empleado empleado; // Almacena un objeto de la clase Empleado en el nodo.
  Nodo? izquierdo; // Referencia al nodo hijo izquierdo (subárbol izquierdo).
  Nodo? derecho; // Referencia al nodo hijo derecho (subárbol derecho).
  
  Nodo(this.empleado); // Constructor que inicializa el nodo con un empleado.
}