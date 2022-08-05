//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_otomasyon/models/student.dart';
import '../models/student.dart';

/// MAIN CLASS ///
class StudentEdit extends StatefulWidget {
  Student studentgelen;
  List<Student> students;
  int index;
  StudentEdit(this.students,this.index,this.studentgelen);
  
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(studentgelen);
  }
  
}

/// MAIN STATE ///
class _StudentEditState extends State<StudentEdit>{
  var formKey = GlobalKey<FormState>();
  Student studentYeni = Student.withoutInfo();
  Student studentGelen2;

  _StudentEditState(this.studentGelen2);

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
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            bildIdField(),
            const SizedBox(height: 5.0,),
            buildFirstNameField(),
            const SizedBox(height: 5.0,),
            buildLastNameField(),
            const SizedBox(height: 5.0,),
            buildGradeField(),
            const SizedBox(height: 10.0,),
            buildSubmitButton(),
          ],
        ),
      ),
    );
  }
  
  bildIdField() {
    return TextFormField(
      decoration: const InputDecoration(
        
        labelText: "Öğrenci no",
        //hintText: "180541001",
      ),
      initialValue: studentGelen2.id.toString(),
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        studentYeni.id = int.parse(value!);
      },
    );
  }

  buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci adı",
        //hintText: "Oğuz",
      ),
      initialValue: studentGelen2.firstName,
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        studentYeni.firstName = value;
      },
    );
  }

  buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci soyadı",
        //hintText: "baş",
      ),
      initialValue: studentGelen2.lastName,
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        studentYeni.lastName = value;
      },
    );
  }

  buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Aldığı not",
        //hintText: "65",
      ),
      initialValue: studentGelen2.grade.toString(),// buraya dışarıdan gelen değeri koyduk
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        studentYeni.grade = int.parse(value!);
      },
    );
  }

  buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: () {
        formKey.currentState!.save();// Tüm formField'ların onSaved'larını çalıştırır
        widget.students[widget.index]=studentYeni;
        Navigator.pop(context);
      },
    );
  }


}

