import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Número da conta',
              dica: '000'),
          Editor(
              controlador: _controladorCampoValor,
              rotulo: 'Valor',
              icone: Icons.monetization_on_outlined,
              dica: '0.00'),
          ElevatedButton(
            child: Text(
              'Confirmar',
            ),
            onPressed: () => _criaTranferencia(context)
          )
        ],
      ),
    );
  }

  void _criaTranferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text) ?? 0;
    final double valor =
        double.tryParse(_controladorCampoValor.text) ?? 0;

    if (numeroConta != 0 && valor != 0) {
      final Transferencia transferenciaCriada =
          Transferencia(valor, numeroConta);

      debugPrint('Transferência: $transferenciaCriada');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$transferenciaCriada'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Atenção: digite apenas valores válidos.',
          ),
          backgroundColor: Color.fromRGBO(201, 18, 18, 1.0),
        ),
      );
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final IconData? icone;
  final String? dica;

  Editor({this.controlador, this.rotulo, this.icone, this.dica});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo,
            hintText: dica),
      ),
    );
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.00, 0001)),
          ItemTransferencia(Transferencia(200.00, 0002)),
          ItemTransferencia(Transferencia(300.00, 0003)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
