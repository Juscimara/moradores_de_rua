import 'package:flutter/material.dart';
import 'package:moradores_de_rua/models/acompanhamento.dart';
import 'package:moradores_de_rua/screens/edit_acompanhamento_screen.dart';
import 'package:provider/provider.dart';

class AcompanhamentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final acompanhamentos = Provider.of<List<Acompanhamento>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Acompanhamentos'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditAcompanhamentosScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: (acompanhamentos != null)
          ? ListView.builder(
              itemCount: acompanhamentos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(acompanhamentos[index].feitoNoDia),
                  trailing: Text(acompanhamentos[index].descricao),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            EditAcompanhamentosScreen(acompanhamentos[index]),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}