import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Food',
        iconPath: 'assets/icons/dog.svg', 
        boxColor: Colors.blue,
        ),
    );

    categories.add(
      CategoryModel(
        name: 'Toys',
        iconPath: 'assets/icons/paw.svg', 
        boxColor: Colors.blueGrey,
        ),
    );

    categories.add(
      CategoryModel(
        name: 'Treats',
        iconPath: 'assets/icons/bone.svg', 
        boxColor: Colors.blue,
        ),
    );

    return categories;
  }
}