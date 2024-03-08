import 'dart:io';

//Functions
String printName(name) => name;

Function getFunction(int operand1, int operand2) {
  return () => (operand1 + operand2);
}

Function sum = getFunction(1, 2);

//Classes -

class RegularClass {
  RegularClass(); //Default constructor.

  //In dart, method or constructor overloading is not allowed, but we can make multiple constructors with the help of named constructors
  RegularClass.constructor1({required this.firstName});
  String? firstName, lastName;

  RegularClass.constructor2({required this.lastName});
}

//Design Pattern to design a class - where only one instance of a class is created and that instance is provided global point of access.
//So for below code all the clases will share the same instance and any changes made will reflect everywhere.
class Singleton {
  static Singleton _instance = Singleton._internal();

  Singleton._internal();

  factory Singleton() => _instance;
}

// With abstract class we wil also understand the difference between implements and extends.
// Classes declared with abstract may or may not have abstract but the classes having abstract methods must be declared as abstract.
// Abstract methods cannot be instantiated.
// In extends if the parent class any abtract then the subclass has to override and provide implementation to those methods only.
// Whereas in implements the child class has to override all the methods even if they are abstract or not.

abstract class Mammal {
  void canWalk(String name) {
    print("$name can walk");
  }

  void canTalk();
  void canSwim();
}

//extends
class Human extends Mammal {
  @override
  void canSwim() {
    print("Humans can swim");
  }

  @override
  void canTalk() {
    print("Humans can talk");
  }
}

//implements
class Humans implements Mammal {
  @override
  void canSwim() {
    print("Humans can swims");
  }

  @override
  void canTalk() {
    print("Humans can talk");
  }

  //the method I am overriding below is not abstract but still I have to override it because I am using implements.
  @override
  void canWalk(String name) {
    print("Humans can walk");
  }
}

//Immutable class - The state of the objects of this class, once created, cannot be changed. That's why all the member are final and can be assigned only once.
///the triple / are also used for writing commenst but these work different the code above which you are writing this comments will diplay when hover over the code related to the code above which you wrote the code and this elements the need for finding the code when working with the code related to it. Usually it is used for specifying hyperlinks.
class ImmutableClass {
  final int x, y;

  const ImmutableClass(this.x, this.y);
}

// As the name suggest these classes are sealed within a specific library and cannot be accessed outside it's library.
// These classes are implicitly abstract and cannot be decalred abstract using abstract modifier explicity.
// These classes cannot be constructed but can have constructor for their child class.
// they can have factory methods.

sealed class SealedClass {
  SealedClass(this.x, this.y);

  int x, y;

  void
      abstractMethod(); //need not to specify the class as abstract as it is already abstract.
}

// Mixins - Mixins are a way/concept of defining code in a such a way that it can be used in multiple classes (class heirarchies), avoiding the need to provide a separate implementation for each class separately.
// There are two keywords used for mixins - with and on.
// with is for using the mixin with classes and on is used is to restrict the usage of mixin to specific class only and there you can only specify a superclass and any other class that is extended a superclass.

mixin Run {
  void running(String name);
  bool isRunning(bool status) => status;
}

mixin TurboEngine on Car {
  double horsePower() => horsePower();
}

class Car {}

class SuperCar extends Car with TurboEngine {}

//Extensions
extension extendedMethod on ImmutableClass {
  void methodForImmutableClass() {
    print("This is a extended method");
  }
}

//Class modifiers
//We have already seen abstract

//2. base
base class BaseClass {
  String name = "Mayur";
}

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

  //To accet user input and return output.
  // stdout.write("Enter your name: ");
  // String fullName = stdin.readLineSync().toString();

  // print(fullName);

  //Using var and dynamic and illustrating them.

  //Using to define a dynamic variable:
  var dynamiceVariable;
  dynamiceVariable = 1;
  dynamiceVariable = "Mayur";
  dynamiceVariable =
      true; //You can store anything in this variable no matter what.

  //But if you did inline intialization then you cannot use it to store anything the type of value will be bound with variable
  var nonDynamic = "Mayur";
  // nonDynamic = 34; Error -> A value of type 'int' can't be assigned to a variable of type 'String'. Try changing the type of the variable, or casting the right-hand type to 'String'.

  //using dynamic
  dynamic dynVariable; //As the name suggests it is dynamic type.

  //Function call
  print(sum());

  //const vs final
  const List<int> numbers = [1, 2, 3, 4, 5, 6];
  // numbers.add(10); //throws an error anything defined using const cannot be modified ever again.

  print(numbers);

  final List<int> scores;

  scores = [56, 65, 6, 34, 45, 44];
  scores.add(10);

  print(scores);

  // scores = [54, 45, 4, 434, 45]; Not allowed because memory location cannot be changed in final.

  // SealedClass sealedClass = SealedClass(); //As Sealed Classes are abstract they cannot be instantiated.

  ImmutableClass immutableObject = ImmutableClass(2,
      4); //Now this object is immutable you cannot modify any of its contents.
  immutableObject.methodForImmutableClass();

  BaseClass obj = BaseClass();
  print(obj.name);
}
