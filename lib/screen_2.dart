import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/providers/todo_provider.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String thisTitle = "";
  String thisDescription = "";


  myvalidator(value){
    if(value.isEmpty || value == null){
      return "Please enter any value here";
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Todo Add Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              // title of todo
              TextFormField(
                onTapOutside: (event){
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                decoration: InputDecoration(
                   hintText: "What is to do?",
                  label: Text("add todo"),
                ),
                validator: (value){
                  myvalidator(value);
                },
                onSaved: (newValue){
                  setState(() {
                    thisTitle = newValue!;
                  });
                },
              ),

              // Description
              TextFormField(
                  onTapOutside: (event){
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  decoration: InputDecoration(
                    hintText: "Enter The Description",
                    label: Text("Add Description"),
                  ),
                  validator: (value){
                    myvalidator(value);
                  },
                  onSaved: (newValue){
                    thisDescription = newValue!;
                  },
                ),

              // Row of Buttons
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // cancle Button
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Icon(Icons.clear_rounded), Text("Cancel")],
                      ),
                    ),
                    
                    // Save Button
                    FilledButton(
                      onPressed: () {
                        if(!_formKey.currentState!.validate()){
                          return;
                        }
                        _formKey.currentState!.save();
                        context.read<TodoProvider>().addTodo(thistitle: thisTitle, thisdescription: thisDescription);
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Icon(Icons.save_alt), Text("Save")],
                      ),
                    ),
                  ],
                ),

              // end of row
            ],
          ),),
        ),
      ),
    );
  }
}