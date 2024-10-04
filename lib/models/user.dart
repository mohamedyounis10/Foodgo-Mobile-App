import 'package:foodgo/models/burger.dart';

class User_app {
  // Private constructor
  User_app._privateConstructor();

  // Singleton instance
  static final User_app _instance = User_app._privateConstructor();

  // Factory method to return the singleton instance
  factory User_app() {
    return _instance;
  }

  // Data
  String fullname='mohamed moahmed';
  String phonenumber='01000000000';
  String email='mohamed12@gmail.com';
  String password='123m';

  // Shopping cart with book and number of copies
  List<Map<Burger, int>> shoppingCart = [];
  List<Burger> favorites = [];
  String address='';
}

