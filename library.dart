class Library {
  List<String> catalog = [];
  List<String> borrowedBooks = [];
  Map<String, Set<String>> issuedItemsDatabase = {};

  void addBook(String book) {
    catalog.add(book);
  }

  void showBookGallery() {
    print("Book Gallery:");
    print("object");
    catalog.forEach((book) => print("- $book"));
  }

  void issueBook(String book, bool isAdmin) {
    if (catalog.contains(book)) {
      if (!borrowedBooks.contains(book)) {
        DateTime dueDate = DateTime.now().add(Duration(days: isAdmin ? 30 : 7));
        String formattedDueDate = dueDate.toString().split(' ')[0];
        borrowedBooks.add(book);
        print("Book '$book' has been issued. Return by $formattedDueDate.");
      } else {
        print("Book '$book' is already borrowed by another user.");
      }
    } else {
      print("Book '$book' is not available in the catalog.");
    }
  }

  void returnBook(String book) {
    if (borrowedBooks.contains(book)) {
      borrowedBooks.remove(book);
      print("Book '$book' has been returned.");
    } else {
      print("Book '$book' is not currently borrowed by any user.");
    }
  }
  void addToIssuedItemsDatabase(String username, String item) {
  if (issuedItemsDatabase.containsKey(item)) {
    issuedItemsDatabase[item]!.add(username);
  } else {
    issuedItemsDatabase[item] = {username};
  }
}

void showIssuedItemsDatabase() {
  print("Issued Items Database:");
  issuedItemsDatabase.forEach((item, users) {
    print("- $item: ${users.length} users");
    users.forEach((user) => print("  - $user"));
  });
}
}
