import 'dart:io'; // For writing to a file
import 'package:hive/hive.dart';

void main() async {
  // Initialize Hive
  Hive.init('hive_data'); // Replace with your Hive directory path if needed

  // Open the box
  var userBox = await Hive.openBox('userBox');

  // Print all key-value pairs in the terminal
  print("Data in userBox:");
  userBox.toMap().forEach((key, value) {
    print('$key: $value');
  });

  // Save data to a file
  var file = File('userBoxData.txt'); // File will be created in the current directory
  await file.writeAsString(userBox.toMap().entries.map((e) => '${e.key}: ${e.value}').join('\n'));
  print("Data has been saved to userBoxData.txt");

  // Close the box
  await userBox.close();
}
