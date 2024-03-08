import 'dart_master_practice.dart';

void main() {
  BaseClass obj = BaseClass();
  print(obj.name);
}

sealed class A {}

class B extends A {
  
}
