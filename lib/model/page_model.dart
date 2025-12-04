import 'dart:convert';
import 'component_model.dart';

class PageModel {
  final List<ComponentModel> components;
  PageModel({required this.components});

  factory PageModel.fromMap(Map<String, dynamic> map) {
    final comps = <ComponentModel>[];
    final raw = map['page']?['components'] as List<dynamic>? ?? [];
    for (final item in raw) {
      try {
        comps.add(ComponentModel.fromMap(Map<String, dynamic>.from(item)));
      } catch (e) {
        // ignore malformed component
      }
    }
    return PageModel(components: comps);
  }

  static PageModel? fromJsonString(String jsonString) {
    try {
      final map = json.decode(jsonString) as Map<String, dynamic>;
      return PageModel.fromMap(map);
    } catch (e) {
      return null;
    }
  }
}