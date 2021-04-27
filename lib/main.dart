import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: ListaTransferencias(),
      appBar: AppBar(title: const Text('Transferências'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    ),
    debugShowCheckedModeBanner: false,
  )
);

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ItemTransferencia(Transferencia('100.00', '0001')),
        ItemTransferencia(Transferencia('200.00', '0002')),
        ItemTransferencia(Transferencia('300.00', '0003')),
      ],
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

  final String valor;
  final String numeroConta;

  Transferencia(this.valor, this.numeroConta);
}