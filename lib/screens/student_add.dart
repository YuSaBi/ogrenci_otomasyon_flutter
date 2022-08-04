//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/student.dart';

/// MAIN CLASS ///
class StudentAdd extends StatefulWidget{

  List<Student> students;
  StudentAdd(this.students);// aşağıdaki constructor'ın dart dilinde kullanımı
  /*StudentAdd(List<Student> students, {Key? key}) : super(key: key){
    this.students = students;
  }*/
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}

/// MAIN STATE ///
class _StudentAddState extends State<StudentAdd>{
  var formKey = GlobalKey<FormState>();
  Student student = Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt ekle"),),
      body: buildBody(),
    );
  }
  
  /// BODY ///
  Container buildBody() {// Dart dilinde dönüş tipini method başlangıcında vermemize gerke yoktur
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,// class altında oluşturduğumuz formKey'i buraya verdik ki dışarıdaki student'a kayıt ekleyebilelim
        child: Column(
          children: <Widget>[
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
  
  /// KULLANICI ADI ///
  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci adı",
        //hintText: "Oğuz",
      ),
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        student.firstName = value;
      },
    );
  }

  /// KULLANICI SOYADI ///
  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci soyadı",
        //hintText: "baş",
      ),
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        student.lastName = value;
      },
    );
  }

  /// KULLANICI ADI ///
  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Aldığı not",
        //hintText: "65",
      ),
      onSaved: (value) {// Buradaki value, onSaved tarafından TextFormField'dan çekiliyor.
        student.grade = int.parse(value!);
      },
    );
  }

  /// KAYDET BUTONU ///
  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: () {
        formKey.currentState!.save();// Tüm formField'ların onSaved'larını çalıştırır
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }

}