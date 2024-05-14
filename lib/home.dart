import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/employee.dart';
import 'package:flutter/material.dart';

import 'service/firestore_database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? empStream;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    empStream = await FireStoreDatabase().getEmpDetails();
    setState(() {});
  }

  Widget allEmpDetails() {
    return StreamBuilder(
        stream: empStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return SizedBox(
                      height: 155,
                      width: double.infinity,
                      child: Card(
                        elevation: 1,
                        margin: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${ds['Name']}',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              Text(
                                'Age :  ${ds['Age']}',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              Text(
                                'Location :  ${ds['Location']}',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Employee()));
            },
            child: Text("Add")),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Firestore ',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                ' Database',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: allEmpDetails());
  }
}
