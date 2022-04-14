import 'car.dart';

class ListCars{

  static List<Car> getCars(){
    return[
      Car(
        name: "Classic Car",
        price: "\$34/day",
        color: 0xFFB67853,
        img: "assets/imgs/Classic.png"
      ),
      Car(
          name: "Sport Car",
          price: "\$55/day",
          color: 0xFF60B5F4,
          img:"assets/imgs/BeepBeepMediumVehicle.png"
      ),      Car(
          name: "Flying Car",
          price: "\$45/day",
          color: 0xFF8382C2,
          img:"assets/imgs/Flying.png"
      ),
      Car(
          name: "Electric Car",
          price: "\$500/day",
          color: 0xFF2A3640,
          img: "assets/imgs/Electric.png"
      )
    ];
  }
}