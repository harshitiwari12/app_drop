import 'package:app_drop/model/page_model.dart';
import 'package:app_drop/services/jsondata_loader.dart';
import 'package:app_drop/widgets/page_rendering.dart' show PageRenderer;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage>createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  late Future<PageModel?> _pageFuture;

  @override
  void initState(){
    super.initState();
    _pageFuture = JsonDataLoader.loadFromAssets('assets/sample.json');
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Renderer — AppDrop')),
      body: FutureBuilder<PageModel?>(
        future:_pageFuture,
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child:Text('Error:${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data == null){
            return const Center(child: Text('Failed to load page.'));
          }
          return PageRenderer(page: snapshot.data!);
        },
      ),
    );
  }
}