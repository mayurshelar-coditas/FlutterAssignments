void main() {
// Assignment 1 - DART BASICS

// 1. Declare a variable named 'message' and assign the value "Hello, Dart!" to it.
  String message = "Hello, Dart!";

// 2. Write a Dart program that checks if a given number is even or odd.
// 		Input: 2
// 		Output:	 2 is even
  void checkEvenOrOdd(int number) {
    number % 2 == 0 ? print("$number is even") : print("$number is odd");
  }

  checkEvenOrOdd(2); //Output - > 2 is even.

// 3. Create a list of fruits and print each fruit using a loop.
// 		Input: ['Apple', 'Banana', 'Orange', 'Grapes']
// 		Output:	 Apple, Banana, Orange, Grapes
  List<String> fruits = ['Apple', 'Banana', 'Orange', 'Grapes'];

  for (String fruit in fruits) {
    print(fruit);
  }
//Output
// Apple
// Banana
// Orange
// Grapes

// 4. Define a function named 'multiply' that takes two parameters and returns their product.
// 		Input: 5, 2
// 		Output:	 The product is 10.

  int multiply(int firstOperand, int secondOperand) {
    return firstOperand * secondOperand;
  }

  print("The product is ${multiply(5, 2)}."); //Output - The product is 10.

// 5. Create a class named 'Person' with a constructor and a method to display the person's name.
// 		Input: Person person = Person(‘Agent Jack’)
// 			person.display()
// 		Output:	 My name is Agent Jack
//Class is defined below the definition of main

  var person = Person('Agent Jack');
  person.display(); //Output -  My name is Agent Jack.

// 6. Define a Dart program that uses a map to store the age of different people and prints the ages.
// 		Input: Map<String, int> ages = {
//     'Alice': 25,
//     'Bob': 30,
//     'Charlie': 22,
//   };

// 		Output:	 Alice is 25 years old //… should print all items in new line

  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 22,
  };

  ages.forEach((name, age) => print("$name is $age years old"));

/* Output - Alice is 25 years old
            Bob is 30 years old
            Charlie is 22 years old */

// 7. Write a Dart function that divides two numbers and handles the case when the denominator is zero. (USING Try Catch)
// 		Input: 5, 2     |  Input: 5, 0
// 		Output:	 2.5   |  Output: Cannot divide by zero.

  void divideNumbers(int firstOperand, secondOperand) {
    try {
      if (secondOperand == 0) throw Exception("Cannot divide by zero");
      print(firstOperand / secondOperand);
    } catch (e) {
      print(e);
    }
  }

  divideNumbers(5, 2); //Output: 2.5
  divideNumbers(5, 0); //Output Cannot divide by zero.

// 8. Write a Dart program that removes duplicates from a list and prints the unique elements.
// 		Input: [1, 2, 3, 2, 4, 5, 1, 6]
// 		Output:	 [1, 2, 3, 4, 5, 6]
  void removeDuplicates(List<int> numbers) {
    numbers.sort();
    for (int number = 0; number < numbers.length - 1; number++) {
      if (numbers[number] == numbers[number + 1]) {
        numbers.removeAt(number);
      }
    }
  }

  List<int> numbers = [1, 2, 3, 2, 4, 5, 1, 6];
  print("Before removing duplicates: $numbers");
  removeDuplicates(numbers);
  print("After removing duplicates: $numbers");

// 9. Write a Dart program that checks whether a given number is positive, negative, or zero.
// 		Input: 7
// 		Output:	 Positive

  String checkNumberSign(int number) {
    if (number > 0) {
      return "Positive";
    } else if (number < 0) {
      return "Negative";
    } else {
      return "Zero";
    }
  }

  print(checkNumberSign(7)); //Output - Positive

// 10. Create a Dart program that uses a switch statement to determine the day of the week based on a given number (1-7). (USING Switch Case)
// 		Input: 3                     | Input: 23
// 		Output:	 Wednesday | Output: Invalid Day number
  void getDayOfWeek(int number) {
    switch (number) {
      case 1:
        print("Monday");
        break;
      case 2:
        print("Tuesday");
        break;
      case 3:
        print("Wednesday");
        break;
      case 4:
        print("Thursday");
        break;
      case 5:
        print("Friday");
        break;
      case 6:
        print("Saturday");
        break;
      case 7:
        print("Sunday");
        break;
      default:
        print("Invalid Day number");
    }
  }

  getDayOfWeek(3); //Output - Wednesday
  getDayOfWeek(23); //Output - Invalid Day number

// 11. Write a Dart program that uses a switch statement to determine the season based on a given month. (January/February/March - Winter), (April/May/June - Sprint), (July,August,September - Summer), (October/November/December - Fall)
// 		Input: Jan
// 		Output:	 Winter

//Here I am not writing break statement because it would become unreachable.
//And I am deliberately using String as return type to illustrate return statements in switch cases.
  String determineSeason(String month) {
    //converting the input to lower case to handle any typo related to case of the string.
    switch (month.toLowerCase()) {
      case "january" || "february" || "march":
        return "Winter";
      case "april" || "may" || "june":
        return "Sprint";
      case "july" || "august" || "september":
        return "Summer";
      case "october" || "november" || "december":
        return "Fall";
      default:
        return "Invalid Month";
    }
  }

  print(determineSeason("March"));

// 12. Write a Dart program that skips printing even numbers from a list of integers using 'continue'.
// 		Input: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// 		Output:	 1,3,5,7,9
  void skipEvenNumbers(List<int> numbers) {
    for (int number in numbers) {
      if (number % 2 == 0) {
        continue;
      }
      print(number);
    }
  }

  skipEvenNumbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

// 13. Create a Dart program that finds the first occurrence of a negative number in a list using 'break'.
// 	Input: [5, 8, -3, 10, -7, 2]
// 		Output:	 5, 8
  void getFirstOccurenceOfNegativeNumber(List<int> numbers) {
    for (int number = 0; number < numbers.length; number++) {
      if (numbers[number] < 0) {
        print("Negative numbers first occurs at index $number");
        break;
      }
    }
  }

  getFirstOccurenceOfNegativeNumber([5, 8, -3, 10, -7, 2]);

// 14. Write a Dart program with a function that calculates the volume of a box.
// The function should take three parameters: length, width, and height.
// Make height an optional parameter with a default value of 1.0.
// Input: length: 10, width: 10, height, 3 | Input: length: 10, width: 10
// 		Output:	 300                                        | Output: 100

  double calculateBoxVolume(double length, double width,
      [double height = 1.0]) {
    return length * width * height;
  }

  print(calculateBoxVolume(10, 10, 3));
  print(calculateBoxVolume(10, 10));

// 15. Write a Dart program that uses an “where” to filter a list of even numbers.
// Input: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// 		Output:	 2,4,6,8,10
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var evenNumbers = numbers.where((n) => n % 2 == 0);
  print(evenNumbers); //Output: (2, 4, 6, 8, 10);

// 16. Combine two lists using spread operator
// Input: [1,2,3,4], [-1,-2,-3,-4]
// Output: [-1,-2,-3,-4, 1,2,3,4]
  List<int> combineLists(firstList, secondList) {
    return [...firstList, ...secondList];
  }

  print(combineLists([-1, -2, -3, -4], [1, 2, 3, 4]));
}

class Person {
  String name;

  Person(this.name);

  void display() {
    print("My name is $name");
  }
}
