import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = ChangeNotifierProvider<CategoryModel>((ref) {
  return CategoryModel();
});

class CategoryModel extends ChangeNotifier {
  final _categories = ['기본 카테고리 (전체 공개)'];

  List<String> get categories => _categories;

  void addCategory(String name, String privacy) {
    _categories.add('$name ($privacy)');
    notifyListeners();
  }

  void reorderCategories(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final String removedCategory = _categories.removeAt(oldIndex);
    _categories.insert(newIndex, removedCategory);
    notifyListeners();
  }
}
