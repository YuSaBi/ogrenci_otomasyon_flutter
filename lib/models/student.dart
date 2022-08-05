import 'dart:math';

class Student{
  int? id;
  String? firstName;
  String? lastName;
  int? grade;
  String? status;
  String? imageUrl;
  bool secili = false;

  Student(String firstName, String lastName, int grade){
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  //named contructor
  Student.withoutInfo(){
    this.id = 4;
    this.firstName = "";
    this.lastName = "";
    this.grade = 0;
    this.imageUrl = "https://i.pravatar.cc/${Random().nextInt(20)+31}";
    this.secili=false;
  }

  //named constructor
  Student.withId(int id,String firstName, String lastName, int grade, String imageUrl){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.imageUrl = imageUrl;
  }

  String get getStatus{
    String message="";
    if(this.grade!>=50){
      message = "Geçti";
    }
    else if(this.grade!>=40){
      message = "Bütünlemeye kaldı";
    }
    else{
      message = "Kaldı";
    }
    this.status=message;
    return this.status!;
  }

}