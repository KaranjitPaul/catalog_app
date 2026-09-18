

import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const new({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: MyTheme.creamColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(16),
        child: Image.network(image, fit: BoxFit.contain),
      ),
    );
  }
}
