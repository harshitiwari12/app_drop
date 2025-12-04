import 'package:app_drop/model/page_model.dart';
import 'package:flutter/material.dart';
import 'component_factory.dart';

class PageRenderer extends StatelessWidget {
  final PageModel page;
  const PageRenderer({super.key, required this.page});
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical:12,horizontal:8),
      itemCount: page.components.length,
      itemBuilder: (context, index){
        final comp=page.components[index];
        return ComponentFactory.build(comp);
      },
    );
  }
}