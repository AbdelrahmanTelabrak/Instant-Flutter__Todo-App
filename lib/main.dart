import 'package:flutter/material.dart';
import 'package:flutter_todo/common/tasks_provider.dart';
import 'package:flutter_todo/view/tasks_activity.dart';
import 'package:provider/provider.dart';

import 'common/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Inter'),
        home: const InitPage(),
      ),
    );
  }
}

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<TasksProvider>(context, listen: false).getTodayTask();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const TasksActivity()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white);
  }
}
