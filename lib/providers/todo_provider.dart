import 'package:flutter/material.dart';
import 'package:to_do_application/model/todo.dart';

class TodoProvider extends ChangeNotifier{
    List<Todo> _todos = [];



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
    print(_todos);
      // at last we should notfiy listeners
      notifyListeners();
    }

    removeTodo({required Todo thistodo}){
      // logic here
      _todos.remove(thistodo);
      // at last we should notify listeners
      notifyListeners();
    }
}