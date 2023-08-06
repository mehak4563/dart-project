import 'user.dart';
import 'library.dart';
import 'dart:io';

class Admin extends User {
  Admin() : super("admin", "password123");

  void performAdminOperations(Library library) {
    print(
          "||*****************************************************************************************||");
    print(
          "||*****************************************************************************************||");
    print(
        "\n||================================== Welcome, $username (Admin)============================||");
    print(
          "||*****************************************************************************************||");
    print(
          "||*****************************************************************************************||");
    library.showBookGallery();

    while (true) {
      
      print(
          "||*****************************************************************************************||");
      print(
          "||==========================   ADMIN MENU                  ================================||");
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
        library.issueBook(book, true);
      } else if (operationChoice == "2") {
        print("Enter the book name to return:");
        String book = stdin.readLineSync()!;
        library.returnBook(book);
      } else {
        print("Invalid choice.");
      }
    }
  }

  bool authenticate(String username, String password) {
    return this.username == username && this.password == password;
  }
}
