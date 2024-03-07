class Singleton {
  static final Singleton _instance = Singleton._internal();

  const Singleton._internal();

  factory Singleton() => _instance;

  //Now any object made for the above singleton class will share some will point to same instance.
  //Any changes made using any of the object to any data member or member function will reflect for all the objects.
}

class ImmutablePoint {
  final int x;
  final int y;

  const ImmutablePoint(this.x, this.y);
}



abstract class Vehicle {
  void moveForward(int meters);
}

class Car extends Vehicle {
  int passengers = 4;

  @override
  void moveForward(int meters) {}
}

// Can be implemented.
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {}
}

mixin CanWalk on Mammal {
  void canWalk() {
    print("This mammal can walk");
  }
}

class Mammal {

}
class Amphibians {

}


class Human extends Mammal with CanWalk{
  
}

void main() {
  ImmutablePoint ip = ImmutablePoint(3, 4);
  print(ip.x);
  print(ip.y);
}