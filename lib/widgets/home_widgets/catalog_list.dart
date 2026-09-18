import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

class CatalogList extends StatelessWidget {
  final List<Item> items;
  const CatalogList({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final catalog = items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 150,
        child: Row(
          children: [
            Hero(tag: Key(catalog.id.toString()),child: CatalogImage(image: catalog.image)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    catalog.name,
                    style: TextStyle(
                      color: MyTheme.darkBluishColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(catalog.desc, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5),
                  OverflowBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${catalog.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(14, 10, 25, 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              MyTheme.darkBluishColor,
                            ),
                            shape: WidgetStatePropertyAll(StadiumBorder()),
                          ),
                          child: Text(
                            "Buy",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
