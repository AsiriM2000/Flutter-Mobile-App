import 'package:flutter/material.dart';
import '../../../db/DataBase.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({required this.userId});
  final int userId;

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _salary = TextEditingController();

  void fetchData() async{
    Map<String, dynamic>? data = await DatabaseHandler.getSingleData(widget.userId);
    if(data != null){
      _name.text = data['name'];
      _address.text = data['address'];
      _salary.text = data['salary'].toString();
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> _updateData(BuildContext context) async {
    Map<String, dynamic> data = {
      'name' : _name.text,
      'address' : _address.text,
      'salary' : _salary.text,
    };
     int id = await DatabaseHandler.updateData(widget.userId, data);
     // ignore: use_build_context_synchronously
     Navigator.pop(context, true);
  }

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _salary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Data SQLite Database'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
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
                        _updateData(context);
                      },
                      child: Text(
                          "Update Data".toUpperCase(),
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
