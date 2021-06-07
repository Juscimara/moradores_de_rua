import 'package:flutter/material.dart';
import 'package:moradores_de_rua/models/acompanhamento.dart';
import 'package:moradores_de_rua/providers/acompanhamento_model.dart';
import 'package:provider/provider.dart';

class EditAcompanhamentosScreen extends StatefulWidget {
  final Acompanhamento acompanhamento;

  EditAcompanhamentosScreen([this.acompanhamento]);

  @override
  _EditAcompanhamentosScreenState createState() => _EditAcompanhamentosScreenState();
}

class _EditAcompanhamentosScreenState extends State<EditAcompanhamentosScreen> {
  final feitoNoDiacontroller = TextEditingController();
  final descricaocontroller = TextEditingController();
  final datacontroller = TextEditingController();
  final excluidocontroller = TextEditingController();
  
  @override
  void initState() {
    if (widget.acompanhamento == null) {
      feitoNoDiacontroller.text = "";
      descricaocontroller.text = "";
      datacontroller.text = "";
      excluidocontroller.text = "";

      final acompanhamentoprovider = Provider.of<AcompanhamentoModel>(context, listen: false);
      acompanhamentoprovider.loadAcompanhamento(Acompanhamento());
    } else {
      //ALTERAR PRODUTO
      feitoNoDiacontroller.text = widget.acompanhamento.feitoNoDia;
      descricaocontroller.text = widget.acompanhamento.descricao;
      datacontroller.text = widget.acompanhamento.data;
      excluidocontroller.text = widget.acompanhamento.excluido;

      final acompanhamentoprovider = Provider.of<AcompanhamentoModel>(context, listen: false);
      acompanhamentoprovider.loadAcompanhamento(widget.acompanhamento);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final acompanhamentoprovider = Provider.of<AcompanhamentoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Acompanhamento"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: feitoNoDiacontroller,
              decoration: InputDecoration(hintText: 'O que foi feito no dia'),
              onChanged: (value) => {
                acompanhamentoprovider.setFeitoNoDia(value),
              },
            ),
            TextField(
              controller: descricaocontroller,
              decoration: InputDecoration(hintText: 'Descrição'),
              onChanged: (value) => {
                acompanhamentoprovider.setDescricao(value),
              },
            ),
            TextField(
              controller: datacontroller,
              decoration: InputDecoration(hintText: 'Data'),
              onChanged: (value) => {
                acompanhamentoprovider.setData(value),
              },
            ),
            TextField(
              controller: excluidocontroller,
              decoration: InputDecoration(hintText: 'Excluido'),
              onChanged: (value) => {
                acompanhamentoprovider.setExcluido(value),
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () {
                acompanhamentoprovider.saveAcompanhamento();
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
            (widget.acompanhamento != null)
                ? TextButton(
                    onPressed: () {
                      acompanhamentoprovider.removeAcompanhamento(widget.acompanhamento.id);
                      Navigator.of(context).pop();
                    },
                    child: Text("Excluir"),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}