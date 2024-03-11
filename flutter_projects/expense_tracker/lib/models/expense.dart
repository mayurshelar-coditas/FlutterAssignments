import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category{food, travel, leisure, work}

class Expense {
   Expense(
      {
        required this.title,
        required this.dateTime,
        required this.amount,
        required this.category
      }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime dateTime;
  final double amount;  
  final Category category;
}
