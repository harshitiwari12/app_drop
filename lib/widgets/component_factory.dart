import 'package:app_drop/components/textblock_widget.dart';
import 'package:app_drop/widgets/banner_widget.dart';
import 'package:app_drop/widgets/carousel_widget.dart';
import 'package:app_drop/widgets/grid_widget.dart';
import 'package:app_drop/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import '../model/component_model.dart' ;
class ComponentFactory {
  static Widget build(ComponentModel model) {
    final padding = model.getInt('padding', 0).toDouble();
    final child = switch (model.type) {
      ComponentType.banner => BannerComponent(model: model),
      ComponentType.carousel => CarouselComponent(model: model),
      ComponentType.grid => GridComponent(model: model),
      ComponentType.video => VideoComponent(model: model),
      ComponentType.text => TextBlockComponent(model: model),
      _ => _unknown(model),
    };

    return Padding(
      padding: EdgeInsets.all(padding),
      child: child,
    );
  }

  static Widget _unknown(ComponentModel model) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text('Unsupported component type: ${model.props['type'] ?? 'unknown'}'),
    );
  }
}