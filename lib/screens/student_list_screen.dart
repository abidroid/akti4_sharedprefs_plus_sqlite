import 'package:flutter/material.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Students List'),
      ),
      body: Column(
        children: [
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
        ],
      ),
    );
  }
}
