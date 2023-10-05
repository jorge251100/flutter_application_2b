// Importa el paquete Flutter necesario
import 'package:flutter/material.dart';

// Define una clase 'Counter' que extiende StatefulWidget
class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

// Define la clase '_CounterState' que extiende State<Counter>
class _CounterState extends State<Counter> {
  int counter = 0;
  // Define una función 'incrementCounter' para incrementar el contador
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  // Define una función 'decrementCounter' para decrementar el contador
  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  // Override del método 'build' para construir la interfaz de usuario
  @override
  Widget build(BuildContext context) {
    return Scaffold(  //Para la estructura
      appBar: AppBar(
        title: Text('Counter'), // Título de la barra de la aplicación
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: $counter', // Muestra el valor del contador
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: incrementCounter, // Acción al presionar el botón de incremento
                  tooltip: 'Increment', // Texto emergente al mantener el puntero sobre el botón
                  child: Icon(Icons.add), // Icono del botón de incremento
                ),
                SizedBox(width: 10),  // Espaciado
                FloatingActionButton(
                  onPressed: decrementCounter, // Acción al presionar el botón de decremento
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),// Icono del botón de decremento
                ),
              ],
            ),
            TextButton(                                          //SE AGREGO ESTA PARTE EN COMPARACIÓN AL EJERCICIO ANTERIOR
              onPressed: () {
// Mostrar un snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('El contador es $counter'),
                  ),
                );
              },
              child: Text('Mostrar snackbar'), // Botón para mostrar el snackbar
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Introduce un número',
              ),
              onChanged: (value) {
                // Actualizar el estado del contador con el valor ingresado en el TextField
                setState(() {
                  counter = int.parse(value);
                });
              },
            ),                                                      //HASTA ESTE PARTE DE ACÁ
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp( // Inicializa la aplicación con el widget 'Counter'
    home: Counter(),
  ));
}
