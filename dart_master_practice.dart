import 'dart:io';

void main() {
  //Data types in dart
  //Numeric
  int number = 10;
  double percentage = 88.9;
  num dynamicNumber = 10;
  dynamicNumber = 10.4;
  BigInt numberOutOfrangeForInt = BigInt.from(5827394857438574835);

  //String
  String firstName = "Mayur",
      lastName = 'Shelar'; //We can both "" and '' for declaring strings.

  //Booleans
  bool isMinor = false;

  //List (Arrays)
  List<String> listOfNames = ['Mayur', 'Atharva', 'Raj', 'Ram'];

  //Sets: can have only unique data
  Set<String> names = {"Mayur", "Atharva", "Raj"};

  //has only unique data and stores in key and values pairs
  Map<String, dynamic> userDetails = {
    "Name": "Mayur Shelar",
    "age": 21,
    "isSingle": true,
    "Average Salary": 456457.456
  };

  //To accet user input.
  stdout.write("Enter your name: ");
  String fullName = stdin.readLineSync().toString();

  print(fullName);
}
