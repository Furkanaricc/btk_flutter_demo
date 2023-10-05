import 'package:btk_flutter_demo/models/Students.dart';
import 'package:btk_flutter_demo/screens/Student_add.dart';
import 'package:btk_flutter_demo/screens/student_edit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

String mesaj = "Uygulama";

class MainApp extends StatefulWidget {
  MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String mesaj = "Öğrenci takip sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Furkan", "Arıç", 55, ""),
    Student.withId(2, "Sena", "Arıç", 80, ""),
    Student.withId(3, "Ebrar", "Arıç", 98, "")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text(mesaj)), body: buildBody(context)),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu : "),
      content: Text(mesaj),
    );
    showDiolog(context: context, builder: (BuildContext context) => alert);
  }

  void showDiolog(
      {required BuildContext context,
      required AlertDialog Function(BuildContext context) builder}) {}

  buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(
                        "${students[index].name} ${students[index].lastName}"),
                    subtitle: Text(
                        "Sınavdan Aldığı Not : ${students[index].grade} " +
                            "[ " +
                            students[index].getStatus +
                            "["),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.name);
                    },
                  );
                })),
        Text("Seçili öğrenci : " + selectedStudent.name),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text('Yeni Ekle'),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentAdd(students)));
                },
                child: Row(
                  children: const [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text('Güncelle'),
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj = "Silindi : " + selectedStudent.name;
                  mesajGoster(context, mesaj);
                },
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text('Sil'),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade < 50) {
      return const Icon(Icons.clear, color: Colors.red);
    } else if (grade >= 50 && grade < 60) {
      return const Icon(Icons.clear, color: Colors.yellow);
    } else if (grade >= 60 && grade <= 100) {
      return const Icon(Icons.done, color: Colors.green);
    } else {
      mesaj = "hatalı not";
    }
    return Container(); // add this line to fix the issue
  }
}
