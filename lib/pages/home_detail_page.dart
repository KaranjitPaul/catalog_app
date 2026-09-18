import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const new({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(32),
        color: Colors.white,
        child: OverflowBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${catalog.price}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 110,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    MyTheme.darkBluishColor,
                  ),
                  shape: WidgetStatePropertyAll(StadiumBorder()),
                ),
                child: Text("Buy", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 3),
                      child: Text(
                        catalog.name,
                        style: TextStyle(
                          color: MyTheme.darkBluishColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Text(catalog.desc, style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
