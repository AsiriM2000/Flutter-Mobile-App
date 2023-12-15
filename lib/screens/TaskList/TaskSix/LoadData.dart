import 'package:flutter/material.dart';
import 'package:task_app/db/DataBase.dart';
import 'package:task_app/screens/TaskList/TaskSix/UpdateData.dart';

class LoadData extends StatefulWidget {
  const LoadData({super.key});

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    _fetchUsers();
    super.initState();
  }

  void _fetchUsers() async{
    List<Map<String, dynamic>> userList = await DatabaseHandler.getData();
    setState(() {
      dataList = userList;
    });
  }

  void _delete(int uId) async{
    int id = await DatabaseHandler.deleteData(uId);
    List<Map<String, dynamic>> updateData = await DatabaseHandler.getData();
    setState(() {
      dataList = updateData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load Data SQLite Database'),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8.0, // Add a shadow to the card
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
            ),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text("Id: "),
                            Text('${dataList[index]['id']}'),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Name: "),
                            Text(dataList[index]['name']),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Address: "),
                            Text(dataList[index]['address']),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Salary: "),
                            Text('${dataList[index]['salary']}'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(onPressed: () {
                                _delete(dataList[index]['id']);
                            }, icon: Icon(Icons.delete, color: Colors.red,)),
                            IconButton(onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                                return UpdateData(userId: dataList[index]['id']);
                              },)).then((result){
                                  if(result == true){
                                    _fetchUsers();
                                  }
                              });
                            }, icon: Icon(Icons.edit, color: Colors.blue,))
                          ],
                        ),
                      ],
                    )

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

