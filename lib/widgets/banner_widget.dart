import 'package:app_drop/model/component_model.dart';
import 'package:flutter/material.dart';

class BannerComponent extends StatelessWidget {
  final ComponentModel model;
  const BannerComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final image = model.getString('image') ?? '';
    final height = model.getDouble('height', 160);
    final radius = model.getDouble('radius', 12);

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: AspectRatio(
        aspectRatio: 16 / 6,
        child: Container(
          height: height,
          color: Colors.grey[200],
          child: image.isEmpty
              ? Center(child: Text('No image'))
              : Image.network(image, fit: BoxFit.cover, errorBuilder: (c, e, s) => _placeholder()),
        ),
      ),
    );
  }

  Widget _placeholder() => Container(
    color: Colors.grey[300],
    child: const Center(child: Icon(Icons.broken_image)),
  );
}
