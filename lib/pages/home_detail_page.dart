import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const new({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Image.network(catalog.image)],
      ),
    );
  }
}