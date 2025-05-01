import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/providers/todo_provider.dart';
import 'package:to_do_application/to_do.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => TodoProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      debugShowCheckedModeBanner: false,
      home:Screen_1(),
    );
  }
}

