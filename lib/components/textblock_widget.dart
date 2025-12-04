import 'package:app_drop/model/component_model.dart';
import 'package:flutter/material.dart';

class TextBlockComponent extends StatelessWidget {
  final ComponentModel model;
  const TextBlockComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final value = model.getString('value') ?? '';
    final size = model.getDouble('size', 16);
    final weight = model.getString('weight') ?? 'normal';
    final alignStr = model.getString('align') ?? 'left';

    final align = switch (alignStr.toLowerCase()) {
      'center' => TextAlign.center,
      'right' => TextAlign.right,
      _ => TextAlign.left,
    };

    final fontWeight = switch (weight.toLowerCase()) {
      'bold' => FontWeight.bold,
      'w600' => FontWeight.w600,
      _ => FontWeight.normal,
    };

    return Text(
      value,
      textAlign: align,
      style: TextStyle(fontSize: size, fontWeight: fontWeight),
    );
  }
}