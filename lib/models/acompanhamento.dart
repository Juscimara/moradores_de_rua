class Acompanhamento {
  final String id;
  final String feitoNoDia;
  final String descricao;
  final String data;
  final String excluido;

  Acompanhamento({this.id, this.feitoNoDia, this.descricao, this.data, this.excluido});

  Map<String, dynamic> toMap() {
    return {'id': id, 'feitoNoDia': feitoNoDia, 'descricao': descricao, 'data':data, 'excluido':excluido};
  }

  Acompanhamento.fromFirestore(Map<String, dynamic> firestoredocument)
      : id = firestoredocument['id'],
        feitoNoDia = firestoredocument['feitoNoDia'],
        descricao = firestoredocument['descricao'],
        data = firestoredocument['data'],
        excluido = firestoredocument['excluido'];
}