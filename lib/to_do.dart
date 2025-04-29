import 'package:flutter/material.dart';
import 'package:to_do_application/model/todo.dart';


class Screen_1 extends StatefulWidget {
  Screen_1({super.key});

  @override
  State<Screen_1> createState() => _Screen_1State();
}

class _Screen_1State extends State<Screen_1> {

  final GlobalKey<FormState> _todoFormKey = GlobalKey();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();


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
                child: Form(
                  key:_todoFormKey,
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                        Text("Add Todo", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(hintText: "What to do?"),
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "K lekhni hokahi ta halieko vai";
                            }else{
                              return null;
                            }
                          },
                          
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(hintText: "Description"),
                          maxLines: 3,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Kehi ta lekhna paro nii yr";
                            }else{
                              return null;
                            }
                          }, 
                          
                        
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilledButton(
                              onPressed: () {
                                if (!_todoFormKey.currentState!.validate()) {
                                  return;
                                }
                                setState(() {
                                  todos.add(
                                    Todo(
                                      id: DateTime.now().toString(),
                                      description: _descriptionController.text,
                                      title: _titleController.text,
                                    ),
                                  );
                                });
                                _todoFormKey.currentState!.save();
                              },
                              child: Text("Add todo"),
                            ),


                            FilledButton(onPressed: (){
                              if(!_todoFormKey.currentState!.validate()){
                                return;
                              }
                            }, child: Text("Back"),)
                          ],
                        ),
                      ],
                )
                
                ),
              ),
            );
          },
        );
      },
      child: Icon(Icons.add),),
    );
  }
}