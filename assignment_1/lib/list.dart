import 'package:flutter/material.dart';

import 'models/car.dart';
import 'models/list_cars_model.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key}) : super(key: key);

  List<Car> cars = ListCars.getCars();
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (BuildContext ctx, int index) {
            return InkWell(
              onTap: () => {
                Navigator.pushNamed(context, "/detail",
                    arguments: {"index": index})
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 170,
                    width: 310,
                    decoration: BoxDecoration(
                        color: Color(cars[index].color),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: ListView(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      children: [
                        Text(
                          cars[index].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          cars[index].price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        (isFavorite)
                            ? Image.asset(
                                "assets/imgs/StarFilled.png",
                                width: 29,
                                height: 29,
                                alignment: Alignment.bottomLeft,
                              )
                            : Image.asset(
                                "assets/imgs/Star.png",
                                width: 29,
                                height: 29,
                                alignment: Alignment.bottomLeft,
                              ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 105, right: 55),
                    alignment: Alignment.bottomRight,
                    child:
                        Image.asset(cars[index].img, width: 200, height: 124),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
