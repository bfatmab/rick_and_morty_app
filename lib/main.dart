import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty_app/app/getit.dart';
import 'package:rickandmorty_app/app/router.dart';
import 'package:rickandmorty_app/app/theme.dart';
import 'package:rickandmorty_app/views/screens/characters_view/character_viewmodel.dart';

void main() {
  setupLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharactersViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
    );
  }
}
