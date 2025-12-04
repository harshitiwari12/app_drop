import 'package:app_drop/pages/home_page.dart';
import 'package:app_drop/services/jsondata_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const AppDropDemo());
}

class AppDropDemo extends StatelessWidget{
  const AppDropDemo({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider<JsonLoader>(
      create: (_) => JsonLoader(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppDrop Dynamic Renderer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}