import 'package:flutter/material.dart';

class EnCeMoment extends StatelessWidget {
  final TextStyle textStyle;
  const EnCeMoment({super.key, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'En ce moment',
            style: textStyle,
          ),
          Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Center(
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 10,
                      // color: Colors.red,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/layer-burger.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'une petite faim?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Venez personnaliser votre Burger',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  backgroundColor: Colors.pink),
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
