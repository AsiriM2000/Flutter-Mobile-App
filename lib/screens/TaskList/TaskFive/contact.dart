import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PhoneContact extends StatefulWidget {
  const PhoneContact({super.key});

  @override
  State<PhoneContact> createState() => _PhoneContactState();
}

class _PhoneContactState extends State<PhoneContact> {
  final List<String> dataList1 = [];
  final List<String> dataList2 = [];
  bool buttonenabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Loader'),
        ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed:buttonenabled?() async {
              Permission permissionC = Permission.contacts;
              final statusC = await permissionC.request();
              if(statusC.isGranted){
                fetchData();
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Permission is not Granted")));
              }
            }:null,

            child: Text('Load ContactList'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList1.length,
              itemBuilder: (context, index) {
                return DataCard(contactName: dataList1[index], contactNumber: dataList2[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> fetchData() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      contacts.forEach((contact) {
        // print('Name: ${contact.displayName}');
        dataList1.add('${contact.displayName}');
      });
      contacts.forEach((contact) {
        contact.phones?.forEach((phone) {
          // print('Phone Number: ${phone.value}');
          dataList2.add('${phone.value}');
        });

      });
      buttonenabled = false;
    });
  }
}

class DataCard extends StatelessWidget {
  final String contactName;
  final String contactNumber;

  DataCard({required this.contactName, required this.contactNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
              key: UniqueKey(),
              elevation: 4.0,
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(contactName),
                    subtitle: Text(contactNumber),
                    leading: Icon(Icons.contacts),
                  ),
                ],
              ),
    );
  }
}