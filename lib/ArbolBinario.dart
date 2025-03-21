// Clase ArbolBinario: Implementa la lógica de inserción y recorridos del árbol binario.
import 'package:sistemaempleados/Empleado.dart';
import 'package:sistemaempleados/Nodo.dart';

// Clase que representa el árbol binario de empleados.
class ArbolBinario {
  Nodo? raiz; // Nodo raíz del árbol.

  // Método para insertar un nuevo empleado en el árbol binario.
  String insertar(int id, String nombre) {
    if (raiz == null) { // Si el árbol está vacío, el nuevo nodo será la raíz.
      raiz = Nodo(Empleado(id, nombre));
      return "Empleado Guardado";
    } else {
      return _insertarRecursivo(raiz!, id, nombre); // Llama a la función recursiva para insertar.
    }
  }

  // Método recursivo para insertar un nuevo empleado en el árbol de manera ordenada.
  String _insertarRecursivo(Nodo nodo, int id, String nombre) {
    if (id == nodo.empleado.id) { // Si el ID ya existe, retorna un mensaje de error.
      return "Empleado no Guardado, ID ingresado ya existe";
    } else if (id < nodo.empleado.id) { // Si el ID es menor, va al subárbol izquierdo.
      if (nodo.izquierdo == null) { // Si el espacio está libre, inserta el nuevo nodo.
        nodo.izquierdo = Nodo(Empleado(id, nombre));
        return "Empleado Guardado";
      } else {
        return _insertarRecursivo(nodo.izquierdo!, id, nombre); // Sigue buscando en el subárbol izquierdo.
      }
    } else { // Si el ID es mayor, va al subárbol derecho.
      if (nodo.derecho == null) { // Si el espacio está libre, inserta el nuevo nodo.
        nodo.derecho = Nodo(Empleado(id, nombre));
        return "Empleado Guardado";
      } else {
        return _insertarRecursivo(nodo.derecho!, id, nombre); // Sigue buscando en el subárbol derecho.
      }
    }
  }

  // Método para recorrer el árbol en preorden (Raíz → Izquierda → Derecha).
  List<String> preorden() {
    List<String> resultado = []; // Lista para almacenar el recorrido.
    _preordenRecursivo(raiz, resultado); // Llama a la función recursiva.
    return resultado; // Retorna la lista con los empleados en orden preorden.
  }

  // Método recursivo para el recorrido preorden.
  void _preordenRecursivo(Nodo? nodo, List<String> resultado) {
    if (nodo != null) { // Verifica que el nodo no sea nulo.
      resultado.add("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}"); // Agrega el nodo actual a la lista.
      _preordenRecursivo(nodo.izquierdo, resultado); // Recorre el subárbol izquierdo.
      _preordenRecursivo(nodo.derecho, resultado); // Recorre el subárbol derecho.
    }
  }

  // Método para recorrer el árbol en inorden (Izquierda → Raíz → Derecha).
  List<String> inorden() {
    List<String> resultado = []; // Lista para almacenar el recorrido.
    _inordenRecursivo(raiz, resultado); // Llama a la función recursiva.
    return resultado; // Retorna la lista con los empleados en orden inorden.
  }

  // Método recursivo para el recorrido inorden.
  void _inordenRecursivo(Nodo? nodo, List<String> resultado) {
    if (nodo != null) { // Verifica que el nodo no sea nulo.
      _inordenRecursivo(nodo.izquierdo, resultado); // Recorre el subárbol izquierdo.
      resultado.add("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}"); // Agrega el nodo actual a la lista.
      _inordenRecursivo(nodo.derecho, resultado); // Recorre el subárbol derecho.
    }
  }

  // Método para recorrer el árbol en postorden (Izquierda → Derecha → Raíz).
  List<String> postorden() {
    List<String> resultado = []; // Lista para almacenar el recorrido.
    _postordenRecursivo(raiz, resultado); // Llama a la función recursiva.
    return resultado; // Retorna la lista con los empleados en orden postorden.
  }

  // Método recursivo para el recorrido postorden.
  void _postordenRecursivo(Nodo? nodo, List<String> resultado) {
    if (nodo != null) { // Verifica que el nodo no sea nulo.
      _postordenRecursivo(nodo.izquierdo, resultado); // Recorre el subárbol izquierdo.
      _postordenRecursivo(nodo.derecho, resultado); // Recorre el subárbol derecho.
      resultado.add("ID: ${nodo.empleado.id}, Nombre: ${nodo.empleado.nombre}"); // Agrega el nodo actual a la lista.
    }
  }
}