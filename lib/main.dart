import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moradores_de_rua/providers/acompanhamento_model.dart';
import 'package:moradores_de_rua/screens/acompanhamentos.dart';
import 'package:moradores_de_rua/services/firestore_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreservice = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AcompanhamentoModel()),
        StreamProvider(create: (context) => firestoreservice.getAcompanhamentos()),
      ],
      child: MaterialApp(
        title: 'Flutter Firestore',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AcompanhamentosScreen(),
      ),
    );
  }
}
