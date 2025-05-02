import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_do_application/model/todo.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_application/model/users.dart';

class TodoProvider extends ChangeNotifier{
    List<Todo> _todos = [];
    List _apiTodo =[];
    List<Users> _users = [];
    List _apiUsers = [];

    // events

    List<Todo> getTodo(){
      return _todos;
    }

    addTodo({required String thistitle, required String thisdescription}){
      // logic here
      _todos.add(
      Todo(
        id: DateTime.now().toString(),
        description: thisdescription,
        title: thistitle,
      ),
    );

      // at last we should notfiy listeners
      notifyListeners();
    }

    removeTodo({required Todo thistodo}){
      // logic here
      _todos.remove(thistodo);
      // at last we should notify listeners
      notifyListeners();
    }

    isCompleted({required Todo thistodo, required bool iscompleted}){
      thistodo.isCompleted = iscompleted;
      notifyListeners();
    }

    fetchData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/todo'),
    );
    final data = jsonDecode(response.body);
    _apiTodo = data;
    _apiTodo.forEach((todo) {
      _todos.add(Todo(title: todo['title'], description: todo['description'], isCompleted: false, id: todo['id'].toString()));
    });

    // _users.forEach((myuser) {
    //   print(myuser.name.first);
    // });

    notifyListeners();
  }
      
    List<Users> getUsers(){
      return _users;
    }





    }