import 'package:flutter/material.dart';
import 'package:task_app/module/Student.dart';

class TaskFour extends StatefulWidget {
   const TaskFour({super.key});

   @override
   State<TaskFour> createState() => _TaskFourState();
 }

 class _TaskFourState extends State<TaskFour> {

  List<Student> student = [
      Student(id: 'S001', name: 'Asiri', address: 'Teldeniya', contact: '0766621021'),
      Student(id: 'S002', name: 'Malsha', address: 'Kurunegala', contact: '0766621022'),
      Student(id: 'S003', name: 'Lakshitha', address: 'Kandy', contact: '0746621022'),
      Student(id: 'S004', name: 'Ruwan', address: 'Panadura', contact: '0756621022'),
      Student(id: 'S005', name: 'Bandara', address: 'Columbo', contact: '0786621022'),
  ];
  
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Task Four'),
        backgroundColor: Colors.amberAccent,
      ),
       body: ListView.builder(
         itemCount: student.length,
         itemBuilder: (context, index) {
           return Card(
             elevation: 8.0, // Add a shadow to the card
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(12.0), // Rounded corners
             ),
             child: Container(
               padding: EdgeInsets.all(16.0),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       const Text("Id: "),
                       Text(student[index].id),
                     ],
                   ),
                   Row(
                     children: [
                       const Text("Name: "),
                       Text(student[index].name),
                     ],
                   ),
                   Row(
                     children: [
                       const Text("Address: "),
                       Text(student[index].address),
                     ],
                   ),
                   Row(
                     children: [
                       const Text("Contact: "),
                       Text(student[index].contact)
                     ],
                   ),
                 ],
               ),
             ),
           );
         },
       ),
    );
   }
 }

