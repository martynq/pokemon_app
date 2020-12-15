import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';
import 'package:pokemon3_app/ui/home_page.dart';

class MyApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }

  @override
  State<StatefulWidget> createState() {

  }
}