import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moradores_de_rua/models/acompanhamento.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  // ADICIONAR OU ALTERAR
  Future<void> saveAcompanhamento(Acompanhamento acompanhamento) {
    return _db.collection('acompanhamentos').doc(acompanhamento.id).set(acompanhamento.toMap());
  }

  // REMOVER
  Future<void> removeAcompanhamento(String acompanhamentoId) {
    return _db.collection('acompanhamentos').doc(acompanhamentoId).delete();
  }

  //CONSULTAR
  Stream<List<Acompanhamento>> getAcompanhamentos() {
    return _db.collection('acompanhamentos').snapshots().map((snapshot) => snapshot
        .docs.map((document) => Acompanhamento.fromFirestore(document.data())).toList());
  }
}
