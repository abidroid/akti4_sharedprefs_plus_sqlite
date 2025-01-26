
import 'package:akti4_sharedprefs_plus_sqlite/db/database_helper.dart';
import 'package:akti4_sharedprefs_plus_sqlite/models/shagird.dart';
import 'package:flutter/material.dart';

class UpdateStudentScreen extends StatefulWidget {
  const UpdateStudentScreen({super.key, required this.shagird});
  final Shagird shagird;

  @override
  State<UpdateStudentScreen> createState() => _UpdateStudentScreenState();
}

class _UpdateStudentScreenState extends State<UpdateStudentScreen> {
  var nameC = TextEditingController();
  var courseC = TextEditingController();
  var mobileC = TextEditingController();
  var totalFeeC = TextEditingController();
  var feePaidC = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameC.text = widget.shagird.name;
    courseC.text = widget.shagird.course;
    mobileC.text = widget.shagird.mobile;
    totalFeeC.text = widget.shagird.totalFee.toString();
    feePaidC.text = widget.shagird.feePaid.toString();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Update Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(widget.shagird.id
              .toString()),
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
                  onPressed: () async {

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

                    // Create an object of Shagird
                    // constructor
                    Shagird shagird = Shagird(
                      id: widget.shagird.id,
                      name: name,
                      course: course,
                      mobile: mobile,
                      totalFee: int.parse(totalFee),
                      feePaid: int.parse(feePaid),
                    );

                    int result = await DatabaseHelper.instance.updateStudent(shagird);

                    if (result > 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Student Updated')));

                      Navigator.of(context).pop(true);
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Student Not Updated')));
                    }

                  }, child: const Text('Update')),

            ],
          ),
        ),
      ),

    );
  }
}
