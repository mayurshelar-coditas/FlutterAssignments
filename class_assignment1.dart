class Singleton {
  static Singleton _instance = Singleton._internal();

  Singleton._internal();

  factory Singleton() => Singleton._instance;

  int counter = 0;
}

class Incrementer {
  Singleton instanceForIncrementer = Singleton();

  void incrementByOne() {
    instanceForIncrementer.counter++;
  }
}

class Decrementor {
  Singleton instanceForDecrementer = Singleton();

  void decrementByOne() {
    instanceForDecrementer.counter--;
  }
}

class IncrementerByTens {
  Singleton instanceForIncrementerByTens = Singleton();

  void incrementByTen() {
    instanceForIncrementerByTens.counter += 10;
  }
}

class Operations {
  Incrementer incrementer = Incrementer();
  Decrementor decrementer = Decrementor();
  IncrementerByTens incrementerByTens = IncrementerByTens();
  Singleton instanceForOperations = Singleton();

  void performOperation() {
    incrementer.incrementByOne();
    decrementer.decrementByOne();
    incrementerByTens.incrementByTen();

    print(instanceForOperations.counter);
  }
}

void main() {
  Operations operations = Operations();

  operations.performOperation();
}
