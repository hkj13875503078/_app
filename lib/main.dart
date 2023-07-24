// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/common/provider/provider.dart';
import 'package:news_app/global.dart';
import 'package:news_app/pages/index/index.dart';
import 'package:news_app/routes.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppState>.value(
            value: Global.appState,
          ),
        ],
        child: Consumer<AppState>(builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
              child: MyApp(),
            );
          } else {
            return MyApp();
          }
        }),
      ),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: staticRoutes,
      home: IndexPage(),
    );
  }
}
