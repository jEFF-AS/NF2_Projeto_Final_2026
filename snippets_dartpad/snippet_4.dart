// ATIVIDADE NF2 - Fidelização de Usuário na Aplicação
// Versão Combinada - Modifique este código
// Tarefas principais:
// 1. Adicionar esconder/mostrar saldo na Home (ícone de olho)
// 2. Melhorar a tela de transferência com valores sugeridos
// 3. Adicionar confirmação com PIN + feedback de sucesso

import 'package:flutter/material.dart';

void main() => runApp(const NeoBankApp());

class NeoBankApp extends StatelessWidget {
  const NeoBankApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00D4AA), brightness: Brightness.dark,)),
        home: const HomePage(),
      );
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
                          },
                        ),
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
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TransferPage())),
              child: const Text("Fazer Transferência"),
            ),
          ],
        ),
      ),
    );
  }
}

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});
  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();

  void _addQuickAmount(double value) {
    _amountController.text = value.toStringAsFixed(2);
  }

  void _confirmTransfer() {
    if (_recipientController.text.isEmpty || _amountController.text.isEmpty) return;

    final pinController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Digite o PIN (1234)"),
        content: TextField(
          controller: pinController,
          keyboardType: TextInputType.number,
          obscureText: true,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              if (pinController.text == "1234") {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Transferência realizada com sucesso!", style: TextStyle(color: Colors.green))),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("PIN incorreto!", style: TextStyle(color: Colors.red))),
                );
              }
            },
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nova Transferência")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(controller: _recipientController, decoration: const InputDecoration(labelText: "Destinatário")),
            const SizedBox(height: 16),
            TextField(controller: _amountController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Valor")),
            const SizedBox(height: 20),
            const Text("Valores sugeridos:"),
            Wrap(
              spacing: 10,
              children: [
                ElevatedButton(onPressed: () => _addQuickAmount(50.00), child: const Text("R\$ 50")),
                ElevatedButton(onPressed: () => _addQuickAmount(100.00), child: const Text("R\$ 100")),
                ElevatedButton(onPressed: () => _addQuickAmount(200.00), child: const Text("R\$ 200")),
                ElevatedButton(onPressed: () => _addQuickAmount(500.00), child: const Text("R\$ 500")),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                _confirmTransfer();
              },
              child: const Text("Confirmar Transferência"),
            ),
          ],
        ),
      ),
    );
  }
}
