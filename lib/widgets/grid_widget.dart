import 'package:app_drop/model/component_model.dart';
import 'package:flutter/material.dart';

class GridComponent extends StatelessWidget {
  final ComponentModel model;
  const GridComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final images = model.getStringList('images');
    final columns = model.getInt('columns', 3);
    final spacing = model.getInt('spacing', 8).toDouble();

    if (images.isEmpty) {
      return Container(
        height: 120,
        color: Colors.grey[100],
        child: const Center(child: Text('No images')),
      );
    }

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final url = images[index];
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(url, fit: BoxFit.cover, errorBuilder: (c, e, s) => _placeholder()),
        );
      },
    );
  }

  Widget _placeholder() => Container(
    color: Colors.grey[300],
    child: const Center(child: Icon(Icons.broken_image)),
  );
}
