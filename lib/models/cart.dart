import 'package:catalog_app/models/catalog.dart';

class CartModel {

  static final catModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => catModel; 

  //catalog field
  late CatalogModel _catalog;

  //collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
