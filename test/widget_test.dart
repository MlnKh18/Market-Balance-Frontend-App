import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  getDataUser();
}

void getDataUser() async {
  try {
    // Load JSON file from assets
    String jsonString = await rootBundle.loadString('../assets/datadummy/users.json');
    Map<String, dynamic> data = jsonDecode(jsonString);

    // Process your JSON data here
    print('Data from users.json: $data');

    // Example: Accessing users array
    // List<dynamic> users = data['users'];
    // print('Users: $users');

    // // Example: Accessing first user
    // Map<String, dynamic> firstUser = users.isNotEmpty ? users.first : {};
    // print('First User: $firstUser');

    // // Example: Accessing specific fields
    // String username = firstUser['username'] ?? '';
    // String email = firstUser['email'] ?? '';
    // print('Username: $username, Email: $email');
  } catch (e) {
    print('Error: $e');
  }
}
