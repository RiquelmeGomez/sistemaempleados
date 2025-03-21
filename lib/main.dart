// Importa el paquete de Flutter para construir la interfaz gráfica
import 'package:flutter/material.dart';
// Importa la clase ArbolBinario desde otro archivo Dart
import 'package:sistemaempleados/ArbolBinario.dart';

// Función principal que inicia la aplicación Flutter
void main() {
  runApp(MaterialApp(
    home: ArbolBinarioApp(), // Establece la pantalla principal de la app
  ));
}

// Define un widget con estado para la aplicación
class ArbolBinarioApp extends StatefulWidget {
  @override
  _ArbolBinarioAppState createState() => _ArbolBinarioAppState();
}

// Estado del widget que manejará la lógica del árbol binario y la interfaz
class _ArbolBinarioAppState extends State<ArbolBinarioApp> {
  final ArbolBinario arbol = ArbolBinario(); // Instancia del árbol binario
  final TextEditingController idController = TextEditingController(); // Controlador para el campo de ID
  final TextEditingController nombreController = TextEditingController(); // Controlador para el campo de Nombre
  String mensaje = ""; // Variable para mostrar mensajes en pantalla
  String recorridoResultado = ""; // Variable para mostrar el resultado del recorrido

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura principal de la pantalla
      appBar: AppBar( // Barra superior con título
        title: Text("Jerarquía de una Empresa"),
        centerTitle: true, // Centra el título en la barra
      ),
      body: Padding( // Agrega espacio alrededor del contenido
        padding: EdgeInsets.all(20.0),
        child: Column( // Organiza los elementos en columna
          crossAxisAlignment: CrossAxisAlignment.center, // Centra los elementos horizontalmente
          children: [
            Text("Registro de empleados", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // Título principal
            SizedBox(height: 20), // Espaciado entre elementos
            TextField( // Campo de entrada para el ID
              controller: idController, // Asigna el controlador al campo
              keyboardType: TextInputType.number, // Activa teclado numérico
              decoration: InputDecoration(labelText: "ID"), // Etiqueta para el campo
            ),
            TextField( // Campo de entrada para el nombre del empleado
              controller: nombreController, // Asigna el controlador al campo
              decoration: InputDecoration(labelText: "Nombre"), // Etiqueta para el campo
            ),
            SizedBox(height: 20), // Espaciado entre elementos
            ElevatedButton( // Botón para guardar un empleado
              onPressed: () {
                setState(() { // Actualiza la interfaz al presionar el botón
                  int? id = int.tryParse(idController.text); // Convierte el ID ingresado en un número
                  String nombre = nombreController.text; // Obtiene el nombre ingresado
                  if (id != null && nombre.isNotEmpty) { // Verifica que los campos no estén vacíos
                    mensaje = arbol.insertar(id, nombre); // Inserta el empleado en el árbol y obtiene el mensaje
                    idController.clear(); // Limpia el campo ID
                    nombreController.clear(); // Limpia el campo Nombre
                  } else {
                    mensaje = "Por favor, ingrese un ID válido y un nombre."; // Mensaje de error si los campos son inválidos
                  }
                });
              },
              child: Text("Guardar", style: TextStyle(fontWeight: FontWeight.bold)), // Texto del botón en negrita
            ),
            SizedBox(height: 20), // Espaciado entre elementos
            Text(mensaje, style: TextStyle(color: Colors.red)), // Muestra mensajes en pantalla
            SizedBox(height: 20), // Espaciado entre elementos
            Row( // Organiza los botones en fila
              mainAxisAlignment: MainAxisAlignment.center, // Centra los botones horizontalmente
              children: [
                ElevatedButton( // Botón para mostrar el recorrido Preorden
                  onPressed: () {
                    setState(() { // Actualiza la interfaz
                      recorridoResultado = "Recorrido Preorden: \n" + arbol.preorden().join(", "); // Ejecuta el recorrido y lo muestra
                    });
                  },
                  child: Text("Preorden", style: TextStyle(fontWeight: FontWeight.bold)), // Texto del botón en negrita
                ),
                SizedBox(width: 10), // Espaciado entre botones
                ElevatedButton( // Botón para mostrar el recorrido Inorden
                  onPressed: () {
                    setState(() { // Actualiza la interfaz
                      recorridoResultado = "Recorrido Inorden: \n" + arbol.inorden().join(", "); // Ejecuta el recorrido y lo muestra
                    });
                  },
                  child: Text("Inorden", style: TextStyle(fontWeight: FontWeight.bold)), // Texto del botón en negrita
                ),
                SizedBox(width: 10), // Espaciado entre botones
                ElevatedButton( // Botón para mostrar el recorrido Postorden
                  onPressed: () {
                    setState(() { // Actualiza la interfaz
                      recorridoResultado = "Recorrido Postorden: \n" + arbol.postorden().join(", "); // Ejecuta el recorrido y lo muestra
                    });
                  },
                  child: Text("Postorden", style: TextStyle(fontWeight: FontWeight.bold)), // Texto del botón en negrita
                ),
              ],
            ),
            SizedBox(height: 20), // Espaciado entre elementos
            Text(recorridoResultado, textAlign: TextAlign.center), // Muestra el resultado del recorrido seleccionado
          ],
        ),
      ),
    );
  }
}



