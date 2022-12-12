import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import '../entities/list_product.dart';
import 'alert_dialog.dart';
import 'function_page.dart';

class Myslidable extends StatelessWidget {
  final Product product;
  final BuildContext currentContext;
  const Myslidable({Key? key, required this.product, required this.currentContext}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (context) async {
              String choose = await showMyDialog(context);
              if (choose == 'ok') {
                Provider.of<ListProduct>(currentContext, listen: false).remove(product);
                ScaffoldMessenger.of(currentContext).showSnackBar(
                    const SnackBar(content: Text('Xóa thành công')
                    ),
                );
              }
            },
            backgroundColor: const Color.fromARGB(255, 250, 3, 3),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Xóa',
          ),
          SlidableAction(
            flex: 2,
            onPressed: (context) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FunctionPage(
                  titleApp: 'Cập nhật sản phẩm',
                  function: 'update',
                  product: product,
                );
              })
              );
            },
            backgroundColor: const Color.fromARGB(255, 55, 112, 9),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Sửa',
          ),
          SlidableAction(
            flex: 2,
            onPressed: (context) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FunctionPage(
                  titleApp: 'Chi tiết sản phẩm',
                  function: 'see',
                  product: product,
                );
              }));
            },
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.remove_red_eye_outlined,
            label: 'Xem',
          ),
        ],
      ),
      child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              const Expanded(
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name),
                    Text(product.description),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  product.price.toInt().toString(),
                ),
              ),
            ],
          )
      ),
    );
  }
}
