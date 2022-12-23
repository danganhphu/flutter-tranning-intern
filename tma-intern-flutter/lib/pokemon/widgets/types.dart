import 'package:flutter/material.dart';

class TypeBadge extends StatelessWidget {
  final type;

  const TypeBadge(this.type);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          //color: const Color.fromARGB(226, 245, 245, 245),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            type.toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
