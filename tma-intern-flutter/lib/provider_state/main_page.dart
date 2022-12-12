import 'package:flutter/material.dart';
import 'package:flutterproject/provider_state/product_page.dart';
import 'package:provider/provider.dart';

import '../entities/list_product.dart';

class MainPageProduct extends StatelessWidget {
  const MainPageProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    currentContext = context;
    return ChangeNotifierProvider(
      create: (context) => ListProduct(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductPage(),
      ),
    );
  }
}