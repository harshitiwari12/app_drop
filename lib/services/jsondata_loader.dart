import 'package:flutter/services.dart';
import '../model/page_model.dart';

class JsonDataLoader {
  static Future<PageModel?> loadFromAssets(String assets) async{
    final json_string = await rootBundle.loadString(assets);
    return PageModel.fromJsonString(json_string);
  }
  static Future<PageModel?> loadfromstring(String json_string) async{
    return PageModel.fromJsonString(json_string);
  }

}