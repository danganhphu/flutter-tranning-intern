import 'package:flutter/widgets.dart';

class Product {
  String name, description;
  double price;

  Product({required this.name, required this.description, required this.price});
}

class ListProduct extends ChangeNotifier {

  final _list = [
    Product(
        name: 'Mít',
        description: 'Mít Thái loại 1',
        price: 20000.0
    ),
    Product(
        name: 'Xoài cát Hoài Lộc',
        description: 'Xoài các xuất xứ Long Khánh',
        price: 75000.0
    ),
    Product(
        name: 'Táo muối Bàng La',
        description: 'Đặc sản Hải Phòng',
        price: 50000.0
    ),
    Product(
        name: 'Sầu riêng MI6',
        description: 'Sầu riêng xuất xứ Khánh Sơn',
        price: 80000.0
    ),
    Product(
        name: 'Bưởi da xanh',
        description: 'Bưởi xuất xứ Tiền Giang',
        price: 40000.0
    ),
    Product(
        name: 'Cam Sành',
        description: 'Cam Sành Tiền Giang loại 1',
        price: 250000.0
    ),
    Product(
        name: 'Thanh Long',
        description: 'Thanh Long giải cứu Phan Thiết',
        price: 10000.0
    ),
    Product(
        name: 'Mãng cầu',
        description: 'Mãng cầu xuất xứ Khánh Vĩnh',
        price: 35000.0
    ),
    Product(
        name: 'Ổi Thanh Hà - Hải Dương',
        description: 'Đặc sản của vùng đất Thanh Hà, tỉnh Hải Dương',
        price: 12000.0
    ),
    Product(
        name: 'Bưởi năm roi',
        description: 'Bưởi năm roi Vĩnh Long',
        price: 30000.0
    ),
  ];

  List<Product> get list => _list;

  void add(Product product) {
    _list.add(product);
    notifyListeners();
    debugPrint('Thêm sản phẩm mới');
  }

  void remove(Product product) {
    _list.removeAt(_list.indexOf(product));
    notifyListeners();
    debugPrint('Xóa sản phẩm');
  }

  void update(Product oldProduct, Product newProduct) {
    _list[_list.indexOf(oldProduct)] = newProduct;
    notifyListeners();
    debugPrint('cập nhật sản phẩm');
  }
}