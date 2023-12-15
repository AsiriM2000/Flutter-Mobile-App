import 'package:flutter/material.dart';
import 'package:task_app/screens/TaskList/TaskFive/TaskFive.dart';
import 'package:task_app/screens/TaskList/TaskFour/TaskFour.dart';
import 'package:task_app/screens/TaskList/TaskOne/TaskOne.dart';
import 'package:task_app/screens/TaskList/TaskSix/CrudOperation.dart';
import 'package:task_app/screens/TaskList/TaskThree/TaskThree.dart';
import 'package:task_app/screens/TaskList/TaskTwo/TaskTwo.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: const Text('Task Menu', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black38,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.numbers, color: Colors.white,),
            title: const Text('Task 01', style: TextStyle(color: Colors.white),),
            subtitle: const Text('Get Input Field Data And Load Screen', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const TaskOne();
              },));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.numbers, color: Colors.white,),
            title: const Text('Task 02', style: TextStyle(color: Colors.white),),
            subtitle: const Text('Screen Navigation', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const TaskTwo();
              },));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.numbers, color: Colors.white,),
            title: const Text('Task 03', style: TextStyle(color: Colors.white),),
            subtitle: const Text('Gallery Or Camera Open Image Load Screen', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const TaskThree();
              },));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.numbers, color: Colors.white,),
            title: const Text('Task 04', style: TextStyle(color: Colors.white),),
            subtitle: const Text('Array Data Load List View And Dynamically Change', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const TaskFour();
              },));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.numbers, color: Colors.white,),
            title: const Text('Task 05', style: TextStyle(color: Colors.white),),
            subtitle: const Text('Location, Contact Or File Storage Access', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const TaskFive();
              },));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.numbers, color: Colors.white,),
            title: const Text('Task 06', style: TextStyle(color: Colors.white),),
            subtitle: const Text('Input Field Data Get And Save SQLite Database', style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const CrudOperation();
              },));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
