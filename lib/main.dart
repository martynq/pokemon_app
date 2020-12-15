import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon3_app/bloc/PokemonsBloc.dart';
import 'package:pokemon3_app/data/repository/pokemon_repository.dart';
import 'package:pokemon3_app/ui/second_page.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.amber,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemons App',
      home: BlocProvider(
        create: (context) {
          return PokemonsBloc(appService: AppService());
        },
        child: ListPokemonPage(),
      ),
    );
  }
}