import 'package:flutter/cupertino.dart';

class StudentFormInput with ChangeNotifier {
  final String name;
  final String id;
  final String department;
  final int year;
  final String email;
  final String mobile;
  final String dob;
  StudentFormInput({
    required this.department,
    required this.dob,
    required this.email,
    required this.id,
    required this.mobile,
    required this.name,
    required this.year,
  });

  static void printstudentdata(StudentFormInput data) {
    print(data.name);
    print(data.id);
    print(data.department);
    print(data.email);
    print(data.mobile);
  }
}
