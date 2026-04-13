// ATIVIDADE NF2 - Fidelização de Usuário na Aplicação
// Exercício 3: Adicionar sensação de segurança
// Tarefa: Implementar confirmação com PIN antes de fazer a transferência + feedback de sucesso

import 'package:flutter/material.dart';

void main() => runApp(const NeoBankApp());

class NeoBankApp extends StatelessWidget {
  const NeoBankApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00D4AA),brightness: Brightness.dark)),
        home: const TransferPage(),
      );
}

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});
  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final _recipientController = TextEditingController();
  final _amountController = TextEditingController();

  void _confirmTransfer() {

    if (_recipientController.text.isEmpty || _amountController.text.isEmpty) return;

    final _pinController = TextEditingController(); 

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Digite o PIN (1234)"),
        content: TextField(
          controller: _pinController,
          keyboardType: TextInputType.number,
          obscureText: true,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              if (_pinController.text == "1234") {
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
            TextField(
              controller: _recipientController,
              decoration: const InputDecoration(labelText: "Destinatário", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Valor (R\$)", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _confirmTransfer();
              },
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
              child: const Text("Realizar Transferência"),
            ),
          ],
        ),
      ),
    );
  }
}
