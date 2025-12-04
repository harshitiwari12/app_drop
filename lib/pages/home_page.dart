import 'package:app_drop/services/jsondata_loader.dart';
import 'package:app_drop/widgets/page_rendering.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late JsonLoader loader;

  @override
  void initState() {
    super.initState();
    loader = Provider.of<JsonLoader>(context, listen: false);
    // Load sample JSON shipped with the app (assets/sample_page.json)
    Future.microtask(() => loader.loadFromAssets('assets/sample_page.json'));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<JsonLoader>(builder: (context, loader, _) {
      if (loader.isLoading) {
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      if (loader.errorMessage != null) {
        return Scaffold(
          appBar: AppBar(title: const Text('Dynamic Renderer')),
          body: Center(child: Text('Error: ${loader.errorMessage}')),
        );
      }

      final page = loader.pageModel;
      if (page == null) {
        return Scaffold(
          appBar: AppBar(title: const Text('Dynamic Renderer')),
          body: const Center(child: Text('No page loaded')),
        );
      }

      return Scaffold(
        appBar: AppBar(title: const Text('Dynamic Renderer — AppDrop')),
        body: PageRenderer(page: page),
      );
    });
  }
}