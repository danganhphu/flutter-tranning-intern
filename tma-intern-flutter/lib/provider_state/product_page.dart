
import 'package:flutter/material.dart';
import 'package:flutterproject/provider_state/slidable_item.dart';
import 'package:provider/provider.dart';

import '../entities/list_product.dart';
import 'function_page.dart';

late BuildContext currentContext;

class ProductPage extends StatefulWidget {

  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (Navigator.canPop(currentContext)) {
                Navigator.pop(currentContext);
              } else {
                debugPrint(Navigator.canPop(currentContext).toString());
              }
            },
          ),
          title: const Text('Danh sách sản phẩm'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const FunctionPage(
                    titleApp: 'Thêm sản phẩm mới',
                    function: 'add',
                  ),
                ));
              },
              icon: const Icon(Icons.add_circle),
            ),
          ],
        ),
        body: Consumer<ListProduct>(
          builder: (context, listProduct, child) {
            return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Myslidable(
                    product: listProduct.list[index],
                    currentContext: context,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  thickness: 1,
                  height: 8,
                ),
                itemCount: listProduct.list.length);
          },
        )
    );
  }
}