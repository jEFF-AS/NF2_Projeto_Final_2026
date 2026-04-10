// ATIVIDADE NF2 - Fidelização de Usuário na Aplicação
// Exercício 1: Melhorar a Home Page
// Tarefa: Adicionar funcionalidade para esconder/mostrar o saldo usando um ícone de olho

import 'package:flutter/material.dart';

void main() {
  runApp(const NeoBankApp());
}

class NeoBankApp extends StatelessWidget {
  const NeoBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00D4AA)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBalance = true;

  final double balance = 12487.65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NeoBank")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [Color(0xFF00D4AA), Color(0xFF00B894)]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Saldo disponível", style: TextStyle(fontSize: 16, color: Colors.white70)),
                        IconButton(
                          icon: Icon(_showBalance ? Icons.visibility : Icons.visibility_off, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _showBalance = !_showBalance;
                            });
                          }
                        )
                      ],
                    ),
                    const SizedBox(height: 8),

                    Text(
                      _showBalance ? "R\$ ${balance.toStringAsFixed(2)}" : "••••••", 
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text("Melhore esta tela adicionando a funcionalidade de esconder o saldo",
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
