import 'package:app_drop/model/page_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class JsonLoader extends ChangeNotifier{
  PageModel? pageModel;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadFromAssets(String assetPath) async{
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final s = await rootBundle.loadString(assetPath);
      final p = PageModel.fromJsonString(s);
      if (p == null) throw Exception('Failed to parse JSON');
      pageModel = p;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadFromString(String jsonString) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      final p = PageModel.fromJsonString(jsonString);
      if (p == null) throw Exception('Failed to parse JSON');
      pageModel = p;
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}