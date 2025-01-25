import 'package:akti4_sharedprefs_plus_sqlite/db/database_helper.dart';
import 'package:akti4_sharedprefs_plus_sqlite/screens/student_list_screen.dart';
import 'package:akti4_sharedprefs_plus_sqlite/screens/update_student_screen.dart';
import 'package:flutter/material.dart';

// Alt + Enter
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaidC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameC,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: courseC,
                decoration: InputDecoration(
                  hintText: 'Course',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: mobileC,
                decoration: InputDecoration(
                  hintText: 'Mobile',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: totalFeeC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Total Fee',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: feePaidC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Fee Paid',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    String name = nameC.text.trim();
                    String course = courseC.text.trim();
                    String mobile = mobileC.text.trim();
                    String totalFee = totalFeeC.text.trim();
                    String feePaid = feePaidC.text.trim();

                    // front end validation

                    if (name.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Name is required')));
                      return;
                    }

                    if (course.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Course is required')));
                      return;
                    }

                    // code

                    DatabaseHelper.instance.addStudent(
                      name,
                      course,
                      mobile,
                      int.parse(totalFee),
                      int.parse(feePaid),
                    );


                  },
                  child: const Text('Save')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const StudentListScreen();
                    }));
                  },
                  child: const Text('View All')),
            ],
          ),
        ),
      ),
    );
  }
}
