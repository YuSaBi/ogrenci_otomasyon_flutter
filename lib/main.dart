import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ogrenci_otomasyon/models/student.dart';
import 'package:ogrenci_otomasyon/screens/student_add.dart';
import 'package:ogrenci_otomasyon/screens/student_edit.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //cupertino
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

/// MAIN CLASS ///
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    //throw UnimplementedError();
    return _HomeScreenState();
  }
  
}

/// MAIN STATE ///
class _HomeScreenState extends State {
  //const HomeScreen({Key? key}) : super(key: key);

  List<Student> students = [
    Student.withId(1, "oğuz", "can", 25, "https://i.pravatar.cc/52"),
    Student.withId(2, "oğuz", "can", 45, "https://i.pravatar.cc/53"),
    Student.withId(2, "oğuz", "can", 77, "https://i.pravatar.cc/54"),
    //Student.withId(2, "oğuz", "can", 15, "https://i.pravatar.cc/55"),
    //Student.withId(2, "oğuz", "can", 75, "https://i.pravatar.cc/56"),
    //Student.withId(2, "oğuz", "can", 35, "https://i.pravatar.cc/57"),
    //Student.withId(2, "oğuz", "can", 25, "https://i.pravatar.cc/58"),
    //Student.withId(2, "mert", "akif", 10, "https://i.pravatar.cc/59"),
    //Student.withId(2, "mert", "akif", 40, "https://i.pravatar.cc/49"),
    //Student.withId(2, "kerim", "usta", 50, "https://i.pravatar.cc/48"),
    //Student.withId(2, "kerim", "usta", 90, "https://i.pravatar.cc/47"),
    Student.withId(2, "kerim", "usta", 18, "https://i.pravatar.cc/46"),
    Student.withId(3, "mert", "korkmaz", 85, "https://i.pravatar.cc/51")
  ];

  Student selectedStudent = Student.withId(0, "None", "", 0, "");
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme Proje "),
      ),
      body: buildBody()
    );
  }
  
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Expanded(// listview için gerekli
            child: builderListView()
          ),
          //Text("Seçili öğrenci "+ selectedStudent.firstName.toString()),
          SizedBox(height: 5.0,),
          Text("Seçili öğrenci ${selectedStudent.firstName} ${selectedStudent.lastName}"),
          //SizedBox(height: 3.0,),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //SizedBox(width: 5.0,),
              buildRegisterButton(),
              buildEditButton(),
              buildDeleteButton(),
              //SizedBox(width: 5.0,)
            ],
          )
        ]
      ),
    );
  }

  Widget buildStatusIcon(int grade){
    if(grade >= 50){
      return Icon(Icons.done_outline);
    }else if(grade >= 40){
      return Icon(Icons.album_outlined);
    }else{
      return Icon(Icons.cancel_outlined);
    }
  }
  
  FutureOr onGoBack(dynamic value){
    setState(() {});
  }

  updateListStudents(Student student){
    this.selectedStudent = student;
  }

  builderListView() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (BuildContext contex, int index){
        return Column(
          children: [
            ListTile(
              title: Text("${students[index].firstName} ${students[index].lastName}"),
              subtitle: Text("Sınavdan aldığı not : ${students[index].grade} [${students[index].getStatus}]"),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(students[index].imageUrl.toString()),
              ),
              trailing: buildStatusIcon(students[index].grade!.toInt()),
              onTap: (){
                setState(() {
                  selectedStudent=students[index];
                  this.index = index;
                });
                print("${students[index].firstName} seçildi");
              },
              onLongPress: () {
                Route route = MaterialPageRoute(builder: (context) => StudentEdit(students,index,students[index]));
                Navigator.push(context, route).then(onGoBack);
              },
            ),
            Divider(height: 5.0,color: Colors.blue.shade300,thickness: 1.0,)
          ],
        );
      } 
    );
  }
  
  buildRegisterButton() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: ElevatedButton(
        //color: Colors.greenAccent,
        child: Row(
          children: const <Widget>[
            Icon(Icons.add),
            SizedBox(width: 3,),
            Text("Yeni Öğrenci")
          ],
        ),
        onPressed: () {
          //print("Eklendi");
          Route route = MaterialPageRoute(builder: (context) => StudentAdd(students));
          Navigator.push(context, route).then(onGoBack);
        },
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(Colors.greenAccent),
        ),
      ),
    );
  }
  
  buildEditButton() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 2,
      child: RaisedButton(
        color: Colors.amberAccent,
        child: Row(
          children: const <Widget>[
            Icon(Icons.add),
            SizedBox(width: 3.0,),
            Text("Düzenle")
          ],
        ),
        onPressed: () {
          if (selectedStudent.id==0) {
            print("Lütfen bir öğrenci seçiniz");
          }
          else{
            Route route = MaterialPageRoute(builder: (context) => StudentEdit(students,index,students[index]));
            Navigator.push(context, route).then(onGoBack);
          }
        },
      ),
    );
}

  buildDeleteButton() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: RaisedButton(
        //style: ,
        //color: Colors.redAccent,
        child: Row(
          children: const <Widget>[
            Icon(Icons.cancel_outlined),
            SizedBox(width: 3.0,),
            Text("Sil")
          ],
        ),
        onPressed: () {
          print("silindi");
        },
      ),
    );
  }
  
}
