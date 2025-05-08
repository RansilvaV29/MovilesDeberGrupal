import 'package:flutter/material.dart';

class Problema4 extends StatefulWidget {
  const Problema4({super.key});

  @override
  State<Problema4> createState() => _Problema4State();
}

class _Problema4State extends State<Problema4> {
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  String _result = '';

  void _calculateResults() {
    setState(() {
      _errorText = null;
      _result = '';
      final input = _controller.text.trim();
      final values = input.split(RegExp(r"\s+"))
          .map((e) => int.tryParse(e))
          .toList();

      if (values.length != 10 || values.contains(null)) {
        _errorText = 'Ingrese exactamente 10 números válidos separados por espacios.';
        return;
      }

      final nums = values.cast<int>();
      final sum = nums.reduce((a, b) => a + b);
      final sumSq = nums.map((e) => e * e).reduce((a, b) => a + b);
      final avg = sum / nums.length;
      final mx = nums.reduce((a, b) => a > b ? a : b);
      final mn = nums.reduce((a, b) => a < b ? a : b);

      _result = '''
Suma: $sum
Suma de cuadrados: $sumSq
Promedio: ${avg.toStringAsFixed(2)}
Máximo: $mx
Mínimo: $mn
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      appBar: AppBar(
        title: const Text('Problema 4'),
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
                    Icon(Icons.analytics, size: 48),
                    SizedBox(height: 12),
                    Text(
                      'Análisis de 10 números',
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
                labelText: 'Ingrese 10 números separados por espacios',
                errorText: _errorText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _calculateResults,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Calcular resultados'),
            ),
            if (_result.isNotEmpty) ...[
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
                      'Resultados',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    Text(_result.trim()),
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