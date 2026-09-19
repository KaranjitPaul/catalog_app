import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const new({super.key, required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.35,
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
                color: Theme.of(context).cardColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32, bottom: 3),
                      child: Text(
                        catalog.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Text(
                      catalog.desc,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Kasd stet sit gubergren sed kasd tempor ipsum dolor sed, eirmod eos dolore amet et clita elitr, dolore vero invidunt accusam duo ea sadipscing et. Lorem ipsum dolore ea clita dolor sadipscing erat voluptua sadipscing, sed diam aliquyam diam ut. Kasd nonumy kasd tempor amet est, sed at eos ea.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(32),
        color: Theme.of(context).cardColor,
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
              width: 136,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(StadiumBorder()),
                ),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
