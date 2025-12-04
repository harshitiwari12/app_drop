
import 'package:flutter/material.dart';

enum ComponentType { banner, carousel, grid, video, text, unknown }

class ComponentModel {
  final ComponentType type;
  final Map<String, dynamic> props;

  ComponentModel({required this.type, required this.props});

  factory ComponentModel.fromMap(Map<String, dynamic> map) {
    final t = (map['type'] as String?)?.toLowerCase() ?? '';
    final type = {
      'banner': ComponentType.banner,
      'carousel': ComponentType.carousel,
      'grid': ComponentType.grid,
      'video': ComponentType.video,
      'text': ComponentType.text,
    }[t] ?? ComponentType.unknown;

    return ComponentModel(type: type, props: Map<String, dynamic>.from(map));
  }

  // helpers
  double getDouble(String key, [double fallback = 0]) {
    final v = props[key];
    if (v == null) return fallback;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? fallback;
  }

  int getInt(String key, [int fallback = 0]) {
    final v = props[key];
    if (v == null) return fallback;
    if (v is int) return v;
    return int.tryParse(v.toString()) ?? fallback;
  }

  String? getString(String key) => props[key]?.toString();

  bool getBool(String key, [bool fallback = false]) {
    final v = props[key];
    if (v == null) return fallback;
    if (v is bool) return v;
    if (v is String) return v.toLowerCase() == 'true';
    return fallback;
  }

  List<String> getStringList(String key) {
    final v = props[key];
    if (v == null) return [];
    if (v is List) return v.map((e) => e.toString()).toList();
    return [v.toString()];
  }
}
