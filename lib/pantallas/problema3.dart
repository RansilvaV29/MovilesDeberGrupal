import 'package:flutter/material.dart';

class Problema3 extends StatefulWidget {
  const Problema3({Key? key}) : super(key: key);

  @override
  State<Problema3> createState() => _Problema3State();
}

class _Problema3State extends State<Problema3> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  int? _sum;
  List<int>? _serie;

  void _calcularSerie() {
    setState(() {
      _errorText = null;
      _sum = null;
      _serie = null;

      final input = _controller.text.trim();
      if (input.isEmpty) {
        _errorText = 'Ingrese un valor para n';
        return;
      }
      final n = int.tryParse(input);
      if (n == null || n <= 0) {
        _errorText = 'Ingrese un número entero positivo';
        return;
      }

      final List<int> tempSerie = [];
      int total = 0;
      for (int i = 1; i <= n; i++) {
        int valor = (i % 2 == 1) ? i : i + 3;
        tempSerie.add(valor);
        total += valor;
      }
      _serie = tempSerie;
      _sum = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      appBar: AppBar(
        title: const Text('Problema 3'),
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
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 24),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Icon(Icons.calculate, size: 48),
                    SizedBox(height: 12),
                    Text(
                      'Serie: 1, 5, 3, 7, 5, 9, 7, ...',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Número de elementos (n)',
                errorText: _errorText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.format_list_numbered),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _calcularSerie,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Calcular'),
            ),
            if (_serie != null && _sum != null) ...[
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Resultado',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Text('Serie generada: ${_serie!.join(', ')}'),
                    const SizedBox(height: 8),
                    Text('Suma total: $_sum', style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('Volver al menú'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
