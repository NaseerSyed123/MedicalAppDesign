import 'package:trevashop_v2/AppLayer/Provider.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/Category.dart';
import 'package:flutter/material.dart';
import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/CategoryManager.dart';

class CatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryManager manager = Provider.of(context).fetch(CategoryManager);
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDO LIST"),
      ),
      body: StreamBuilder<List<Category>>(
        stream: manager.categoryList,
        builder: (context, snapshot) {
          List _catList = snapshot.data;
          Category _cat = _catList[0];
          return ListView.builder(
              itemBuilder: (context,int index){

                return ListTile(
                  title: Text(_cat.included[index].attributes.catalogLabel),
                  //subtitle: Text((_todo.completed).toString()),


                );
              },

              itemCount: _cat.included.length
          );
        }
      ),
    );
  }
}
