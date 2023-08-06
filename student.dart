import 'user.dart';
import 'library.dart';
import 'dart:io';

class Student extends User {
  Student(String username) : super(username, "pass123");
  void performStudentOperations(Library library) {
    print(
          "||*****************************************************************************************||");
    print(
          "||*****************************************************************************************||");
    print(
       "\n ||======================= Welcome, $username (Student)=====================================||");
    print(
          "||*****************************************************************************************||");
    print(
          "||*****************************************************************************************||");
    library.showBookGallery();

    while (true) {
      print(
          "||*****************************************************************************************||");
      print(
          "||==========================   Student MENU                ================================||");
      print(
          "||========================== Select operation              ================================||");
      print(
          "||==========================1. Issue Book                  ================================||");
      print(
          "||==========================2. Return Book                 ================================||");
      print(
          "||==========================3. Logout                      ================================||");
      print(
          "||*****************************************************************************************||");

      String operationChoice = stdin.readLineSync()!;
      if (operationChoice == "3") {
        break;
      }

      if (operationChoice == "1") {
        print("Enter the book name to issue:");
        String book = stdin.readLineSync()!;
        library.issueBook(book, false);
      } else if (operationChoice == "2") {
        print("Enter the book name to return:");
        String book = stdin.readLineSync()!;
        library.returnBook(book);
      } else {
        print("Invalid choice.");
      }
    }
  }

  bool authenticate(String password) {
    return this.password == password;
  }
}
