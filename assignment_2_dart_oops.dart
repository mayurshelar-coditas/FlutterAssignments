// 1. Class - Engine
//    1. The Engine class has attributes like fuel type(should be an Enum), horsepower, and efficiency.
//    2. The constructor initializes these attributes when creating an Engine object.
//    3. Methods like start, stop, and displayDetails are included to perform actions related to the engine.
//    4. In the main function, create the engine object and execute start, stop and display details methods

//As question No. 3 states to convert the class Engine to abstract I have removed the implementation of start and stop as Engine cannot be instantiated.
//Also we never explicity invoke start() and stop() methods but have declared them to force the subclasses to implement them.
//But have kept the implementation of display details as it required for next questions.

abstract class Engine implements Service {
  FuelType _fuelType;
  double _horsePower, _efficiency;

  Engine(this._fuelType, this._horsePower, this._efficiency);

  void start();

  void stop();

  void displayDetails() {
    print(
        "Fuel type: ${_fuelType.name}\nHorsepower: $_horsePower\nEfficiency: $_efficiency");
  }

  //Using getters and setter for encapsulations and security pusposes
  FuelType get fuelType => _fuelType;
  double get horsePower => _horsePower;
  double get efficiency => _efficiency;

  set fuelType(FuelType newFuelType) => _fuelType = newFuelType;
  set horsePower(double newHorsePower) => _horsePower = newHorsePower;
  set efficiency(double newEfficiency) => _efficiency = newEfficiency;
}

// 2. Class - Car Engine
//    1. Class CarEngine should be derived from Engine class.
//    2. Should have attributes of Engine Class and additional attribute ‘cylinders’ and ‘cc’ and ‘model’’
//    3. Override the display details to include cylinder details
//    4. In the main function create the carEngine object and execute start, stop and display details.
//    5. Display details should print `Model - Car Engine` followed by the other details.
//    6. Create Factory methods for creating xuv300, xuv500, xuv700 with prefilled data for horsePower, efficiency, cylinders, cc and model(to be set to the variant xuv300, xuv500 and xuv700 respectively) and required params for fuel type.
//    7. Create objects for xuv300Petrol, xuv500Petrol and xuv700Petrol and similarly for diesel variants.
class CarEngine extends Engine {
  CarEngine(super.fuelType, super.horsePower, super.efficiency, this._cylinders,
      this._cc, this._model);

  int _cylinders, _cc;
  String _model;

  factory CarEngine.xuv300(FuelType fuelType) {
    return CarEngine(fuelType, 115.05, 22, 5, 1497, 'xuv300');
  }
  factory CarEngine.xuv500(FuelType fuelType) {
    return CarEngine(fuelType, 152.87, 15.1, 5, 2179, 'xuv500');
  }
  factory CarEngine.xuv700(FuelType fuelType) {
    return CarEngine(fuelType, 173.05, 17, 5, 2597, 'xuv700');
  }
  @override
  void checkEngineCondition() {
    fuelType == FuelType.petrol ? print("Good!") : print("Bad!");
  }

  // 3. Convert Engine to an Abstract class.
  //    1. Override  start, stop, and displayDetails in CarEngine

  @override
  void start() {
    print("$_model car engine started.");
  }

  @override
  void stop() {
    print("$_model car engine stopped.");
  }

  @override
  void displayDetails() {
    displayModelAndType();
    super.displayDetails();
    print("Cylinder: $_cylinders");
    print("CC: $_cc");
  }

  void displayModelAndType() {
    print("$_model - Car Engine");
  }

  //Using getter and setters for CarEngine too, to avoid any updates through objects.
  int get cylinders => _cylinders;
  int get cc => _cc;
  String get model => _model;

  set cylinders(int updatedCylinders) => _cylinders = updatedCylinders;
  set cc(int updatedCc) => _cc = updatedCc;
  set model(String updatedModel) => _model = updatedModel;
}

// 4. Interface - Service
//    1. Create an interface Service
//    2. Define a checkEngineCondition method
//    3. Engine class should implement Service Interface
//    4. Car Engine class should override checkEngineCondition and print Good for all petrol vehicles and Bad Diesel vehicles
abstract class Service {
  void checkEngineCondition();
}

// 5. Class - Truck Engine
//    1. Create a TruckEngine class and should be derived from Engine class
//    2. Should have attributes of Engine Class and additional attribute ‘Cargo’ capacity
//    3. Override the display details to include cargo capacity details. Display details should print `Truck Engine` followed by the other details.
//    4. In the main function create the truckEngine object and execute start, stop and display details.

class TruckEngine extends Engine {
  TruckEngine(super.fuelType, super.horsePower, super.efficiency,
      this.cargoCapacityInKgs);

  double cargoCapacityInKgs;

  @override
  void displayDetails() {
    print("Truck Engine");
    super.displayDetails();
    print("Cargo Capacity: $cargoCapacityInKgs kg");
  }

  @override
  void checkEngineCondition() {
    if (fuelType == FuelType.petrol) {
      print("Good!");
    } else if (fuelType == FuelType.diesel) {
      print("Bad!");
    }
  }

  @override
  void start() {
    print("Truck Engine Started");
  }

  @override
  void stop() {
    print("Truck Engine stopped");
  }
}

// 6. Class - SuperCar Engine
//    1. Class SuperCar Engine should be derived from the CarEngine class.
//    2. Should have attributes of CarEngine and additional attributes ‘hasTurbo(bool)’, specialFeatures(list), topSpeed
//    3. Display details should print `Model - SuperCar Engine` followed by the other details.

class SuperCar extends CarEngine {
  SuperCar(
      super.fuelType,
      super.horsePower,
      super.efficiency,
      super.cylinders,
      super.cc,
      super.model,
      this._hasTurbo,
      this._specialFeatures,
      this._topSpeed);

  bool _hasTurbo;
  List<String> _specialFeatures;
  int _topSpeed;

  @override
  void displayDetails() {
    super.displayDetails();
    print("Has Turbo: $_hasTurbo");
    print("Special Features: $_specialFeatures");
    print("Top Speed: $_topSpeed");
  }

  @override
  void displayModelAndType() {
    print("$model - SuperCar Engine");
  }

  //Using getters and setters for this class too.
  bool get hasTurbo => _hasTurbo;
  List<String> get specialFeatures => _specialFeatures;
  int get topSpeed => _topSpeed;

  set hasTurbo(bool updatedStatus) => _hasTurbo = updatedStatus;
  set specialFeatures(List<String> updatesFeatures) =>
      _specialFeatures = updatesFeatures;
  set topSpeed(int newTopSpeed) => _topSpeed = newTopSpeed;
}

// 7. Extension - CarExtension
//    1. Create an Extension on CarEngine class with method convertToSuperCar()
//    2. convertToSuperCar extension should convert the Car obj to a Super Car object.
//    3. Create a xuv500 object using the factory method Car.xuv500(FuelType.petrol)
//    4. Execute xuv500.display details().
//    5. Expected output is - xuv500 - Car Engine followed by other details
//    6. Assign xuv500 = xuv500.convertToSuperCar()
//    7. Execute xuv500.displayDetails()
//    8. Expected output is - xuv500 - SuperCar Engine followed by other details
extension convertCarToSuperCarExtension on CarEngine {
  SuperCar convertCarToSuperCar(
      bool hasTurbo, List<String> specialFeatures, int topSpeed) {
    return SuperCar(fuelType, horsePower, efficiency, cylinders, cc, model,
        hasTurbo, specialFeatures, topSpeed);
  }
}

enum FuelType { petrol, diesel, electric, hybrid }

void main() {
  //Commented below part because abstract classes cannot be instantiated and que. 3 states to convert Engine to an abstract class
  //and below part is related to question 1
  // Engine myEngine = Engine(FuelType.petrol, 150, 78.2);
  // myEngine.start();
  // myEngine.stop();
  // myEngine.displayDetails();

  CarEngine carEngine =
      CarEngine(FuelType.diesel, 460, 7.9, 8, 5038, 'Ford Mustand GT');
  carEngine.start();
  carEngine.stop();
  carEngine.displayDetails();

  CarEngine xuv300Petrol = CarEngine.xuv300(FuelType.petrol);
  CarEngine xuv500Petrol = CarEngine.xuv500(FuelType.petrol);
  CarEngine xuv700Petrol = CarEngine.xuv700(FuelType.petrol);

  CarEngine xuv300Diesel = CarEngine.xuv300(FuelType.diesel);
  CarEngine xuv500Diesel = CarEngine.xuv500(FuelType.diesel);
  CarEngine xuv700Diesel = CarEngine.xuv700(FuelType.diesel);

  TruckEngine truckEngine = new TruckEngine(FuelType.petrol, 150, 50.2, 100);
  truckEngine.start();
  truckEngine.stop();
  truckEngine.displayDetails();

  var xuv500 = CarEngine.xuv500(
      FuelType.petrol); // Here I am using var for flexible typing
  xuv500.displayDetails();

  xuv500 = xuv500.convertCarToSuperCar(
      false, ["Automatic Headlamps", "Central Locking"], 200);

  xuv500.displayDetails();
}
