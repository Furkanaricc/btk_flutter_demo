class Student {
  late int id;
  late String name;
  late String lastName;
  late int grade;
  late String status;

  Student.withId(this.id, this.name, this.lastName, this.grade, this.status);

  Student.withoutInfo();

  String get getName {
    return "OGR - " + this.name;
  }

  void set setName(String value) {
    this.name = value;
  }

  String get getStatus {
    String message = "";

    if (this.grade < 50) {
      message = "Kaldınız";
    } else if (this.grade >= 50 && this.grade < 70) {
      message = "Geçtiniz";
    } else if (this.grade >= 70 && this.grade < 85) {
      message = "İyi";
    } else if (this.grade >= 85 && this.grade <= 100) {
      message = "Pekiyi";
    } else {
      message = "Hatalı puan girdiniz";
    }

    return message;
  }
}
