import 'package:assignment_1/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Text('Beepy',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Colors.black)),
            const SizedBox(height: 77),
            Image.asset(
              "assets/imgs/BeepBeepDrifting.png",
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 32),
            const Text('Find Your Vehicle',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black)),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      child: Text(
                        'Find the perfect vehicle for every occasion!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListPage()),
                )
              },
              child: Ink(
                decoration: const BoxDecoration(
                    color: Color(0xffFA7F35),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 115),
                    child: Text('Continue',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
