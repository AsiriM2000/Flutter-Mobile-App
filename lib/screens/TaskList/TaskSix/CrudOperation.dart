import 'package:flutter/material.dart';
import 'package:task_app/db/DataBase.dart';
import 'package:task_app/screens/TaskList/TaskSix/LoadData.dart';

class CrudOperation extends StatefulWidget {
  const CrudOperation({super.key});

  @override
  State<CrudOperation> createState() => _CrudOperationState();
}

class _CrudOperationState extends State<CrudOperation> {
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _salary = TextEditingController();

  void _saveData() async{
    final name = _name.text;
    final address = _address.text;
    final salary = double.tryParse(_salary.text) ?? 0;
    int insertId = await DatabaseHandler.insertUser(name, address, salary);
    print(insertId);
  }

  void _clearField(){
    _name.text = "";
    _address.text = "";
    _salary.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Data Database for SQLite'),
      ),
      body:ListView(
        children: [
          Center(
            child:Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Name'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _address,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Address'
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: _salary,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Salary'
                        ),
                      ),
                    ),
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
                        _saveData();
                        _clearField();
                      },
                      child: Text(
                          "Save Data".toUpperCase(),
                          style: const TextStyle(fontSize: 14)
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              )
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return const LoadData();
                        },));
                      },
                      child: Text(
                          "View Data".toUpperCase(),
                          style: const TextStyle(fontSize: 14)
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),

    );
  }

}
