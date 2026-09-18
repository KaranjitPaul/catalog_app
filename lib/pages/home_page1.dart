import 'dart:convert';

import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            : GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                    child: GridTile(
                      header: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                        child: Text(
                          items[index].name,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      footer: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text(
                          "\$${items[index].price}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      child: Image.network(items[index].image),
                    ),
                  );
                },
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
// ListView.builder(
//   itemCount: items.length,
//   itemBuilder: (context, index) {
//     return ItemWidget(item: items[index]);
//   },
// ),
