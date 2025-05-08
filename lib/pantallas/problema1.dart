/*Diseñe un algoritmo que reciba dos enteros positivos y
devuelva uno, si los números recibidos son primos relativos y devuelva cero en caso contrario.
Dos números son primos relativos si no tienen divisores comunes excepto la unidad. El algoritmo
debe considerar las validaciones de datos que sean necesarias.
*/

import 'package:flutter/material.dart';

class Problema1 extends StatefulWidget {
  const Problema1({Key? key}) : super(key: key);

  @override
  State<Problema1> createState() => _Problema1State();
}

class _Problema1State extends State<Problema1> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  String? _resultadoTexto;
  int _calcularPrimosRelativos() {
    String texto1 = _controller1.text.trim();
    String texto2 = _controller2.text.trim();

    if (texto1.isEmpty || texto2.isEmpty) {
      _resultadoTexto = 'Ingrese ambos números.';
      return 2;
    }
    int num1 = int.parse(texto1);
    int num2 = int.parse(texto2);

    if (num1 <= 0 || num2 <= 0) {
      _resultadoTexto = 'Ingrese solo números enteros positivos.';
      return 2;
    }

    List<int> multiplosNum1 = [];
    List<int> multiplosNum2 = [];

    int contador = 0;
    for (int i = 1; i <= num1; i++) {
      if (num1 % i == 0) {
        multiplosNum1.add(i);
      }
    }

    for (int j = 1; j <= num2; j++) {
      if (num2 % j == 0) {
        multiplosNum2.add(j);
      }
    }

    //verificar si son coprimos
    for (int k = 0; k < multiplosNum2.length; k++) {
      for (int l = 0; l < multiplosNum1.length; l++) {
        if (multiplosNum1[l] == multiplosNum2[k]) {
          contador++;
          if (contador > 1) {
            return 0; //no son primos relativos
          }
        }
      }
    }
    if (contador == 1) {
      return 1; //son primos relativos
    }

    setState(() {});
    return 0; //no son primos relativos
  }

  //diseño
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Problema 1'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Verifica si dos números son primos relativos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Primer número',
                prefixIcon: const Icon(Icons.looks_one),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Segundo número',
                prefixIcon: const Icon(Icons.looks_two),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                int resultado = _calcularPrimosRelativos();

                setState(() {
                  if (resultado == 1) {
                    _resultadoTexto = 'Los números son primos relativos.';
                  } else if (resultado == 0) {
                    _resultadoTexto = 'Los números no son primos relativos.';
                  } else {
                    _resultadoTexto;
                  }
                });
              },
              icon: const Icon(Icons.calculate),
              label: const Text('Calcular'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (_resultadoTexto != null)
              Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _resultadoTexto!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Volver'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 215, 215),
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
