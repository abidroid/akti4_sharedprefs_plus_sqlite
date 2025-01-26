class Shagird {
  int? id;
  String name;
  String course;
  String mobile;
  int totalFee;
  int feePaid;

  // constructor
  Shagird({
    this.id,
    required this.name,
    required this.course,
    required this.mobile,
    required this.totalFee,
    required this.feePaid,
  });

 factory Shagird.fromMap (Map<String, dynamic> map){
   return Shagird(
     id: map['id'],
     name: map['name'],
     course: map['course'],
     mobile: map['mobile'],
     totalFee: map['totalFee'],
     feePaid: map['feePaid'],
   );
  }
}
