import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterproject/todo_list/events/events.dart';
import '../bloc/bloc.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txtName = TextEditingController();
    var bloc = Provider.of<UserBloc>(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtName,
            decoration: const InputDecoration(labelText: 'Add user'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
        ),
        ButtonTheme(
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.redAccent, // foreground
            ),
            onPressed: () {
              bloc.event.add(AddUserEvent(txtName.text));
            },
            child: const Text('Add User', style: TextStyle(fontSize: 18, color: Colors.white),),
          ),
        ),
      ],
    );
  }
}

