void main (){
  Car benz = Car(320, 10000, 'Benz');
  benz.saleCar();
  benz.saleCar();
  benz.saleCar();

  print(benz.price);

}

class Car {
  int? maxSpeed;
  num? price;
  String? name;

  Car(int this.maxSpeed, num this.price, String this.name);
  num? saleCar(){
    price = price! * 0.9;
    return price;
  }

}