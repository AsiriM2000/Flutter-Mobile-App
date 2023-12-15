import 'package:flutter/material.dart';

class TaskOne extends StatefulWidget {
  const TaskOne({super.key});

  @override
  State<TaskOne> createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contact = TextEditingController();

  String name = "";
  String email = "";
  String contact = "";
  
  void _setText() {
    setState(() {
      name = _name.text;
      email = _email.text;
      contact = _contact.text;
    });
  }
  void _clearText() {
    setState(() {
      _name.text = "";
      _email.text = "";
      _contact.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task One'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _contact,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Contact'
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                          )
                      )
                  ),
                  onPressed: () {
                    _setText();
                    _clearText();
                  },
                  child: Text(
                      "Save Data".toUpperCase(),
                      style: const TextStyle(fontSize: 14)
                  ),
              )
            ],
          ),
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
                          Text(name)
                      ],
                    ),
                    Row(
                      children: [
                          const Text("Email: "),
                          Text(email)
                      ],
                    ),
                    Row(
                      children: [
                          const Text("Contact: "),
                          Text(contact)
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
