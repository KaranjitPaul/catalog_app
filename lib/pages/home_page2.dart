import 'dart:convert';

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final catalogJson = await rootBundle.loadString(
      "assets/files/catalog.json",
    );
    final decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    //List<Item> list
    CatalogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final items = CatalogModel.items;

    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (items == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(item: items[index]);
                },
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
