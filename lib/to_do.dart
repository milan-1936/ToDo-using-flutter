import 'package:flutter/material.dart';
import 'package:to_do_application/model/todo.dart';


class Screen_1 extends StatelessWidget {
  Screen_1({super.key});

  List<Todo> todos = [
    Todo(id: "1", title: "This is demo 1", description: "Yo ta sakkiyo"),
    Todo(id: "2", title: "This is demo 2", description: "Second nii sakkiyo", isCompleted: true),
    Todo(id: "3", title: "This is demo 3", description: "Yo ta jhan sakki halyo nii")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Application"),
      ),
      body: Column(
        children: [
       
        SizedBox(
          height: 500,
          width: double.infinity,
          child: ListView.builder(itemBuilder: (ctx, i){
          return ListTile(
              leading: Checkbox(
                value: todos[i].isCompleted,
                onChanged:(value){},
              ),
              title: Text(todos[i].title),
              subtitle: Text(todos[i].description),
            );
          },
          itemCount: todos.length,
        ),
        )
        ],


      ),

      floatingActionButton: FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                        Text("Add Todo", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          decoration: InputDecoration(hintText: "What to do?"),
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Description"),
                          maxLines: 3,
                        
                        ),
                        FilledButton(onPressed: () {}, child: Text("Add todo")),
                        FilledButton(onPressed: (){}, child: Text("Back"),)
                      ],
                )),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),),
    );
  }
}