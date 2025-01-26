import 'package:akti4_sharedprefs_plus_sqlite/db/database_helper.dart';
import 'package:akti4_sharedprefs_plus_sqlite/models/shagird.dart';
import 'package:flutter/material.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Students List'),
      ),
      body: FutureBuilder<List<Shagird>>(
          future: DatabaseHelper.instance.getAllShagirds(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if( snapshot.hasData){

              List<Shagird> shagirdaan = snapshot.data!;

              return ListView.builder(
                  itemCount: shagirdaan.length,
                  itemBuilder: (context, index){

                    Shagird shagird = shagirdaan[index];

                    return  Card(
                      color: Colors.amber,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          spacing: 10,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 120, child: Text('Name')),
                                Text(shagird.name),
                              ],
                            ),

                            Row(
                              children: [
                                SizedBox(width: 120, child: Text('Course')),
                                Text(shagird.course),
                              ],
                            ),

                            Row(
                              children: [
                                SizedBox(width: 120, child: Text('Moible')),
                                Text(shagird.mobile),
                              ],
                            ),

                            Row(
                              children: [
                                SizedBox(width: 120, child: Text('Total Fee')),
                                Text(shagird.totalFee.toString()),
                              ],
                            ),

                            Row(
                                children: [
                                  SizedBox(width: 120, child: Text('Fee Paid')),
                                  Text(shagird.feePaid.toString()),
                                ]),

                            Row(
                              spacing: 10,
                              children: [
                                Expanded(child: ElevatedButton(onPressed: (){
                                  // show alert dialog




                                }, child: const Text('Delete'))),
                                Expanded(child: ElevatedButton(onPressed: (){}, child: const Text('Update'))),
                              ],)
                          ],
                        ),
                      ),
                    );

              });

            }
            else if(snapshot.hasError){
              return Center(child: Text('Something went wrong'),);
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          })
    );
  }
}

/*
 Card(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 120, child: Text('Name')),
                      Text('Ali'),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: 120, child: Text('Course')),
                      Text('Mobile App Dev'),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: 120, child: Text('Moible')),
                      Text('937377373737373'),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: 120, child: Text('Total Fee')),
                      Text('30000'),
                    ],
                  ),

                  Row(
                    children: [
                      SizedBox(width: 120, child: Text('Fee Paid')),
                      Text('10000'),
                    ]),

                  Row(
                    spacing: 10,
                    children: [
                      Expanded(child: ElevatedButton(onPressed: (){}, child: const Text('Delete'))),
                      Expanded(child: ElevatedButton(onPressed: (){}, child: const Text('Update'))),
                    ],)
                ],
              ),
            ),
          ),
 */