import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/Students.dart';
import '../validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;

  StudentAdd(List<Student> students);
  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  late List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students) {
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
            buildNameField(),
            buildLastNameField(),
            buildGradeField(),
            buildSubmitButton(),
          ]),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
        decoration: const InputDecoration(
            labelText: "Öğrenci Adı : ", hintText: "Furkan"),
        validator: (value) => validateFirstName(value!),
        onSaved: (String? value) {
          student.name = value!;
        });
  }

  buildLastNameField() {
    return TextFormField(
        decoration: const InputDecoration(
            labelText: "Öğrenci Soyadı : ", hintText: "Arıç"),
        validator: (value) => validateLastName(value!),
        onSaved: (String? value) {
          student.lastName = value!;
        });
  }

  buildGradeField() {
    return TextFormField(
        decoration:
            const InputDecoration(labelText: "Aldığı not: ", hintText: "100"),
        validator: (value) => validateGrade(value!),
        onSaved: (String? value) {
          student.grade = int.parse(value!);
        });
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.name);
    print(student.lastName);
    print(student.grade);
  }
}
