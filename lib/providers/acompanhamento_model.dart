import 'package:flutter/foundation.dart';
import 'package:moradores_de_rua/models/acompanhamento.dart';
import 'package:uuid/uuid.dart';
import 'package:moradores_de_rua/services/firestore_service.dart';

class AcompanhamentoModel extends ChangeNotifier {
  final firestoreservice = FirestoreService();

  String _id;
  String _feitoNoDia;
  String _descricao;
  String _data;
  String _excluido;
  var uuid = Uuid();

  //GETTERS AND SETTERS
  String get feitoNoDia => _feitoNoDia;
  String get descricao => _descricao;
  String get data => _data;
  String get excluido => _excluido;

  setFeitoNoDia(String afeitoNoDia){
    _feitoNoDia = afeitoNoDia;
    notifyListeners();
  }

  setDescricao(String adescricao){
    _descricao = adescricao;
    notifyListeners();
  }

  setData(String adata){
    _data = adata;
    notifyListeners();
  }

  setExcluido(String aexcluido){
    _excluido = aexcluido;
    notifyListeners();
  }

  loadAcompanhamento(Acompanhamento acompanhamento){
    _feitoNoDia = acompanhamento.feitoNoDia;
    _descricao = acompanhamento.descricao;
    _data = acompanhamento.data;
    _excluido = acompanhamento.excluido;
  }

  saveAcompanhamento(){
    //CREATE
    if(_id == null){
      var novoAcompanhamento = Acompanhamento(feitoNoDia: feitoNoDia, descricao:descricao, data:data, excluido:excluido, id: uuid.v4());
      firestoreservice.saveAcompanhamento(novoAcompanhamento);
    }
    else{
      //UPDATE
      var alteraAcompanhamento = Acompanhamento(feitoNoDia: feitoNoDia, descricao:descricao, data:data, excluido:excluido, id: _id);
      firestoreservice.saveAcompanhamento(alteraAcompanhamento);
    }
  }

  removeAcompanhamento(String acompanhamentoId){
    firestoreservice.removeAcompanhamento(acompanhamentoId);
  }
}
