import 'dart:io';

// This class exhibits Encapsulation because...
class WebsiteUser {
  static String _privAcc = "Mitzi";
  String _privPass = "Password123";

  changeUsername(name) {
    _privAcc = name;
  }

  name() {
    return _privAcc;
  }
}

// This class exhibits Abstraction because...
class WebsiteSystem extends WebsiteUser {
  checkAcc() {
    while (true) {
      print("\nUsername: ");
      String? acc = stdin.readLineSync();
      if (name() == acc) {
        checkPass();
        break;
      } else {
        print("\nCan't find account.");
        continue;
      }
    }
  }

  checkPass() {
    while (true) {
      print("\nPassword: ");
      String? pass = stdin.readLineSync();
      if (_privPass == pass.toString()) {
        system();
        break;
      } else {
        print("\nWrong password.");
        continue;
      }
    }
  }

  system() {
    while (true) {
      GreetUser().greet();
      print("\nWhat would you like to do?");
      print("1 - Change Display Name");
      print("2 - Logout");
      String? choice = stdin.readLineSync();
      if (choice == "1") {
        DisplayName changeName = DisplayName();
        changeName.changeName();
        continue;
      } else if (choice == "2") {
        print("\nLoging you out...");
        exit(0);
      } else {
        print("\nType the correct number.");
        continue;
      }
    }
  }
}

// This class exhibits Inheritance because...
class GreetUser extends WebsiteUser {
  greet() {
    print("\nWelcome " + name() + "!");
  }
}

// This class exhibits Polymorphism because...
class DisplayName extends WebsiteUser {
  changeName() {
    print("\nNew Display Name:");
    String? newName = stdin.readLineSync();
    String newDisplay = newName.toString();
    changeUsername(newDisplay);
  }
}

void main() {
  WebsiteSystem().checkAcc();
}
