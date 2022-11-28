class Car {
  String make;
  String model;
  String yearMade;
  bool hasABS;

  Car(this.make, this.model, this.yearMade, this.hasABS);

  void print_make() {
    print(make);
  }
}

void main() {
  var a_car = new Car("a", "b", "c", true);
  a_car.print_make();
}
