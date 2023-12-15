import 'package:flutter/material.dart';

class DataLoadPage extends StatelessWidget {
  String name, email, contact;
  DataLoadPage({required this.name, required this.email, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Load Page'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Name: "),
                          Text(name),

                        ],
                      ),
                      Row(
                        children: [
                          const Text("Email: "),
                          Text(email),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Contact: "),
                          Text(contact),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
