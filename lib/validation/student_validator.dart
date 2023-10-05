class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır.";
    } else {
      // İsim koşulu sağlanmadığında başka bir değer döndürün veya null döndürün.
      return ""; // veya farklı bir değer döndürebilirsiniz.
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "İsim en az iki karakter olmalıdır.";
    } else {
      // İsim koşulu sağlanmadığında başka bir değer döndürün veya null döndürün.
      return ""; // veya farklı bir değer döndürebilirsiniz.
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);

    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasında olmalıdır.";
    } else {
      return "";
    }
  }
}
