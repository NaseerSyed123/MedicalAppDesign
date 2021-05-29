import 'package:trevashop_v2/Screen/B1_HomeScreen/CategoryPanelHome/CategoryManager.dart';

import 'package:flutter/material.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};
  static String userRole = 'Doctor';

  Overseer() {
    register(CategoryManager, CategoryManager());

// register managers
  }

  // register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }

  // get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}
