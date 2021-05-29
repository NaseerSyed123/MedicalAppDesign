import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/Category.dart';

class CategoryService {
  static String _url = 'https://run.mocky.io/v3/3d663279-dffd-4dd4-a0e3-ce5581aa26af';
     // 'http://store.welldoneapps.net/jsonapi/catalog?include=catalog,media,text';


  static Future browse() async {
    print("printig from service >>>");
    http.Response response = await http.get(_url);
    String content = response.body;
   // print("printig from service >>>1 ${content}");
    List collection = json.decode(content);

    List<Category> _categoryList =
    collection.map((json) => Category.fromJson(json)).toList();


    print("the count is ${_categoryList.length}");
    return _categoryList;
  }

}


