import 'package:flutter/material.dart';
import 'package:task_app/screens/TaskList/TaskFive/contact.dart';
import 'package:task_app/screens/TaskList/TaskFive/map.dart';

class TaskFive extends StatefulWidget {
  const TaskFive({super.key});

  @override
  State<TaskFive> createState() => _TaskFiveState();
}

class _TaskFiveState extends State<TaskFive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Five'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Center(
                  child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                            return const LocationScreen();
                        },));
                      },
                      icon: const Icon(Icons.location_pin, color: Colors.red, size: 50,)),
                ),
              ),
              Container(
                height: 200,
                child: Center(
                  child: IconButton(
                      onPressed: ()  {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return  PhoneContact();
                        },));
                      },
                      icon: const Icon(Icons.phone, color: Colors.blue, size: 50,)),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
