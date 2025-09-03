import 'package:flutter/material.dart';
import 'package:flutter_application_rick_morty/viewmodel/character_list_view_model.dart';
import 'package:flutter_application_rick_morty/views/home_view.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CharacterListViewmodel(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Rick and Morty")),
        body: HomeView(),
      ),
    );
  }
}
