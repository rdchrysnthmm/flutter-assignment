import 'package:flutter/material.dart';

import 'models/car.dart';
import 'models/list_cars_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Car> cars = ListCars.getCars();
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    //int index = (arguments['index']);
    int index = 0;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            const Expanded(
              child: Text(
                "Cars",
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child:
                  Image.asset("assets/imgs/Avatar.png", width: 39, height: 39),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF2A3640),
              ),
            ),
          ],
        ),
      ),
      body: ListView(padding: const EdgeInsets.only(left: 10, right: 10),
        children: [
          Image.asset(
            cars[index].img,
            height: 290,
            width: 352,
          ),
          Container(
            height: 500,
            width: 343,
            decoration: BoxDecoration(
                color: Color(cars[index].color),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: ListView(
              padding: EdgeInsets.only(top:30, left: 20, right: 20),
              children: [
                Row(
                  children: [
                    Expanded(child: Text(cars[index].name, style: const TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ))),
                    Image.asset(
                      "assets/imgs/Star.png",
                      width: 29,
                      height: 29,
                      alignment: Alignment.bottomLeft,
                    )
                  ],
                ),
                Text(cars[index].price, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                )),
                const SizedBox(height: 32),
                const Text("Description", style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                )),
                const SizedBox(height: 15),
                Text("Wanna ride the coolest ${cars[index].name.toLowerCase()} in the world?", style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Poppins',
                )),
                const SizedBox(height: 45),
                InkWell(
                  onTap: () => {},
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: const Padding(
                        padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 115),
                        child: Text('Book Now',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.black))),
                  ),
                )
              ],
            ) ,
          ),
        ],
      ),
    );
  }
}
