//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_otomasyon/models/student.dart';
import '../models/student.dart';

/// MAIN CLASS ///
class StudentEdit extends StatefulWidget {
  Student student;
  List<Student> students;
  StudentEdit(this.students,this.student);
  
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState();
  }
  
}

/// MAIN STATE ///
class _StudentEditState extends State<StudentEdit>{
var formKey = GlobalKey<FormState>();
Student student = Student.withoutInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Düzenle"),),
      body: buildBody(),
    );
  }
  
  /// BODY ///
  buildBody() {
    return Container(
      margin: const EdgeInsets.all(20.0),

    );
  }

}

