import 'package:flutter/material.dart';
import 'package:flutterproject/todo_list/bloc/bloc.dart';
import 'package:flutterproject/todo_list/events/events.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserList extends StatefulWidget{

  const UserList ({Key? key}) : super(key: key);
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      child: buildConsumer()
    );
  }

  Consumer<UserBloc> buildConsumer() {
    return Consumer<UserBloc>(
    builder: (context, bloc, child) => StreamBuilder<List<User>>(
        stream: bloc.userListStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      color: (index) % 2 == 0 ? Colors.green : Colors.teal,
                      elevation: 10,
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          snapshot.data![index].name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            bloc.event.add(DeleteUserEvent(snapshot.data![index]));
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red[400],
                          ),
                        ),
                      ),
                    );
                  }
              );
            case ConnectionState.none:
            default:
              return const Center(
                child: Text('Không có data'),
                // child: CircularProgressIndicator(),
              );

          }
        }
    ),
  );
  }
}