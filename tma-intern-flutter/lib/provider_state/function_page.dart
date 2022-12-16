import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../entities/list_product.dart';

class FunctionPage extends StatefulWidget {
  final String titleApp;
  final String function;
  final Product? product;

  const FunctionPage({Key? key, required this.titleApp, required this.function, this.product}) : super(key: key);

  @override
  State<FunctionPage> createState() => _FunctionPageState();
}

class _FunctionPageState extends State<FunctionPage> {
  final TextEditingController  name  = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price  = TextEditingController();
  String? labelButton;

  @override
  Widget build(BuildContext context) {

    if (widget.product != null) {
      name.text = widget.product!.name;
      price.text = widget.product!.price.toString();
      description.text = widget.product!.description;
    }
    if (widget.function == 'add') {
      labelButton = 'Thêm';
    } else if (widget.function == 'update') {
      labelButton = 'Cập nhật';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleApp),
      ),
      body: Column(
        children: [
          MyTextField(
            controller: name,
            labelText: 'Tên sản phẩm',
          ),
          MyTextField(
              controller: description,
              labelText: 'Mô tả',
          ),
          MyTextField(
              controller: price,
              labelText: 'Giá',
          ),
          if (widget.function != 'see')
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Product product = Product(
                          name: name.text,
                          description: description.text,
                          price: double.parse(price.text),
                        );
                        if (widget.function == 'add') {
                          Provider.of<ListProduct>(context, listen: false).add(product);
                        } else {
                          Provider.of<ListProduct>(context, listen: false).update(widget.product!, product);
                        }
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: widget.function == 'add' ? const Text('Thêm thành công') : const Text('Cập nhật thành công'),
                            ),
                          );
                        } else {
                          debugPrint('fail pop');
                        }
                      },
                    child: Text(labelButton!),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const MyTextField({Key? key, required this.controller, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border:  const OutlineInputBorder()
        ),
      ),
    );
  }
}

