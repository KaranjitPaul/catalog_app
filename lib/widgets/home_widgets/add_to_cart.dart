import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  final String text;

  const AddToCart({super.key, required this.catalog, required this.text});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  void initState() {
    super.initState();

    // Initialize the catalog before accessing cart.items.
    _cart.catalog = CatalogModel();
  }

  void onPressCart() {
    if (isInCart) {
      _cart.remove(widget.catalog);
    } else {
      _cart.add(widget.catalog);
    }

    setState(() {});
  }

  bool get isInCart => _cart.items.any((item) => item.id == widget.catalog.id);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressCart();
      },
      style: widget.text == "+"
          ? const ButtonStyle(shape: WidgetStatePropertyAll(CircleBorder()))
          : ButtonStyle(),
      child: isInCart
          ? const Icon(Icons.done, color: Colors.white)
          : Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
    );
  }
}
