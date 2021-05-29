import 'dart:async';
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/Category.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/CategoryService.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class CategoryManager {

  final BehaviorSubject<List<Category>> _product = BehaviorSubject<List<Category>>();

  Stream<List<Category>> get categoryList async* {

    yield await CategoryService.browse();
  }

  CategoryManager() {
    print("-- printing from product manager???");
    // productList.listen((value) => _product.addStream(productList));

  }

}