// ignore_for_file: file_names

import 'dart:io' show stdin, stdout;

List<Map<String, dynamic>> students = [];
var txtName = "";
var txtAge = "";
var txtFirst = "";
var txtSecond = "";
var option = "";

void main() {
  do {
    menu();
    option = stdin.readLineSync()!;
    executeOperation(option);
  } while (option != "0");
}

void executeOperation(String optionSelected) {
  if (optionSelected != "0") {
    switch (optionSelected) {
      case "1":
        addStudent();
        break;
      case "2":
        print("Remove Student...");
        break;
      case "3":
        printStudents();
        break;
      default:
    }
  }
}

void printStudents() {
  print("\x1B[2J\x1B[0;0H");
  print("========== Printing students ==========");
  //print(students);
  for (var item in students) {
    stdout.write(
        "\nNome: ${item["name"]} | Final Grade: ${item["average"]} | Situation: ${item["situation"]}");
  }
  stdin.readLineSync();
}

void addStudent() {
  print("\x1B[2J\x1B[0;0H");
  print("========== Adding a new student ==========");

  stdout.write("Inform your name: ");
  txtName = stdin.readLineSync()!;

  stdout.write("Inform your age: ");
  txtAge = stdin.readLineSync()!;

  stdout.write("Inform your first grade: ");
  txtFirst = stdin.readLineSync()!;

  stdout.write("Inform your second grade: ");
  txtSecond = stdin.readLineSync()!;

  Map<String, dynamic> student = {};
  student["name"] = txtName;
  student["age"] = txtAge;
  student["first"] = txtAge;
  student["second"] = txtFirst;
  student["average"] = txtSecond;
  student["situation"] = evaluate(txtFirst, txtSecond);
  students.add(student);
}

String evaluate(String txtFirst, String txtSecond) {
  var intFirst = int.tryParse(txtFirst);
  var intSecond = int.tryParse(txtSecond);
  var avg = ((intFirst! + intSecond!) / 2);
  return avg.toInt() >= 7 ? "Aproved" : "Reproved";
}

menu() {
  print("\x1B[2J\x1B[0;0H");
  print("========== SCHOOL ==========");
  print("\n1. Add Student");
  print("2. Remove Student");
  print("3. Print Students");
  print("0. Exit");
  print("\n============================");
  stdout.write("Choose an Option: ");
}
