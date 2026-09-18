import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const new({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
