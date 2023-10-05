import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/Students.dart';
import '../validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  late Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  late Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Güncelle"),
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
        initialValue: selectedStudent.name,
        decoration: const InputDecoration(
            labelText: "Öğrenci Adı : ", hintText: "Furkan"),
        validator: (value) => validateFirstName(value!),
        onSaved: (String? value) {
          selectedStudent.name = value!;
        });
  }

  buildLastNameField() {
    return TextFormField(
        initialValue: selectedStudent.lastName,
        decoration: const InputDecoration(
            labelText: "Öğrenci Soyadı : ", hintText: "Arıç"),
        validator: (value) => validateLastName(value!),
        onSaved: (String? value) {
          selectedStudent.lastName = value!;
        });
  }

  buildGradeField() {
    return TextFormField(
        initialValue: selectedStudent.grade.toString(),
        decoration:
            const InputDecoration(labelText: "Aldığı not: ", hintText: "100"),
        validator: (value) => validateGrade(value!),
        onSaved: (String? value) {
          selectedStudent.grade = int.parse(value!);
        });
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.name);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
