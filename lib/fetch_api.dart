import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/model/users.dart';
import 'package:to_do_application/providers/todo_provider.dart';

class ApiData extends StatelessWidget {
  const ApiData({super.key});

  @override
  Widget build(BuildContext context) {
    print("Does this run?");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text("Fetching Data From API"),
      ),
      body: Expanded(child: Consumer<TodoProvider>(
        builder: (context, providerContext, child){
          print("This only should run");
          List<Users> users = providerContext.getUsers();
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(users[index].profilePic)),
                title: Text(users[index].name.first),
                subtitle: Text(users[index].email),
              );
            },
          );
        }),
        ),
    );
  }
}