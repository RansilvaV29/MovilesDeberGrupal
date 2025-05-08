import 'package:flutter/material.dart';
import 'pantallas/problema3.dart';
import 'pantallas/problema4.dart';
import 'pantallas/problema1.dart';
import 'pantallas/problema2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
      routes: {
        '/problema1': (context) => const Problema1(),
        '/problema2': (context) => const Problema2(),
      },
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Seleccione un problema:',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: [
                    _ProblemaCard(
                      title: 'Problema 1',
                      icon: Icons.filter_1,
                      onTap: () {
                        Navigator.pushNamed(context, '/problema1');
                      },
                    ),
                    _ProblemaCard(
                      title: 'Problema 2',
                      icon: Icons.filter_2,
                      onTap: () => Navigator.pushNamed(context, '/problema2'),
                    ),
                    _ProblemaCard(
                      title: 'Problema 3',
                      icon: Icons.filter_3,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Problema3()),
                      ),
                    ),
                    _ProblemaCard(
                      title: 'Problema 4',
                      icon: Icons.filter_4,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const Problema4()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProblemaCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _ProblemaCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: SizedBox(
          width: 140,
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

