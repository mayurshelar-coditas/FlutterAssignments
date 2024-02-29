// 1. Class - Engine
//    1. The Engine class has attributes like fuel type(should be an Enum), horsepower, and efficiency.
//    2. The constructor initializes these attributes when creating an Engine object.
//    3. Methods like start, stop, and displayDetails are included to perform actions related to the engine.
//    4. In the main function, create the engine object and execute start, stop and display details methods

// 2. Class - Car Engine
//    1. Class CarEngine should be derived from Engine class.
//    2. Should have attributes of Engine Class and additional attribute ‘cylinders’ and ‘cc’ and ‘model’’
//    3. Override the display details to include cylinder details 
//    4. In the main function create the carEngine object and execute start, stop and display details.
//    5. Display details should print `Model - Car Engine` followed by the other details.
//    6. Create Factory methods for creating xuv300, xuv500, xuv700 with prefilled data for horsePower, efficiency, cylinders, cc and model(to be set to the variant xuv300, xuv500 and xuv700 respectively) and required params for fuel type.
//    7. Create objects for xuv300Petrol, xuv500Petrol and xuv700Petrol and similarly for diesel variants.

// 3. Convert Engine to an Abstract class.
//    1. Override  start, stop, and displayDetails in CarEngine

// 4. Interface - Service
//    1. Create an interface Service 
//    2. Define a checkEngineCondition method
//    3. Engine class should implement Service Interface
//    4. Car Engine class should override checkEngineCondition and print Good for all petrol vehicles and Bad Diesel vehicles 

// 5. Class - Truck Engine
//    1. Create a TruckEngine class and should be derived from Engine class
//    2. Should have attributes of Engine Class and additional attribute ‘Cargo’ capacity
//    3. Override the display details to include cargo capacity details. Display details should print `Truck Engine` followed by the other details.
//    4. In the main function create the carEngine object and execute start, stop and display details.

// 6. Class - SuperCar Engine 
//    1. Class SuperCar Engine should be derived from the CarEngine class.
//    2. Should have attributes of CarEngine and additional attributes ‘hasTurbo(bool)’, specialFeatures(list), topSpeed
//    3. Display details should print `Model - SuperCar Engine` followed by the other details.

// 7. Extension - CarExtension
//    1. Create an Extension on Car class with method convertToSuperCar()
//    2. convertToSuperCar extension should convert the Car obj to a Super Car object.
//    3. Create a xuv500 object using the factory method Car.xuv500(FuelType.petrol) 
//    4. Execute xuv500.display details(). 
//    5. Expected output is - xuv500 - Car Engine followed by other details
//    6. Assign xuv500 = xuv500.convertToSuperCar()
//    7. Execute xuv500.displayDetails()
//    8. Expected output is - xuv500 - SuperCar Engine followed by other details
