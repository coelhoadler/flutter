import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24.0
                ),
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '000'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: TextField(
                controller: _controladorCampoValor,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24.0
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0.00'
                ),),
            ),
            ElevatedButton(
              child: Text('Confirmar',),
              onPressed: () {
                final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text) as int;
                final double valor = double.tryParse(_controladorCampoValor.text) as double;

               final Transferencia transferenciaCriada = Transferencia(
                    valor, numeroConta);

                debugPrint('Tranferência: $transferenciaCriada');

              },)
          ],
        ),);
  }
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
      appBar: AppBar(title: const Text('Transferências'),),
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