// ignore_for_file: prefer_const_constructors_in_immutables, library_private_types_in_public_api, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Cagegory'),
    );
  }
}
