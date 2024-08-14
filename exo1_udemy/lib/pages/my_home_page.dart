import 'package:exo1_udemy/widgets/chaud_devant.dart';
import 'package:exo1_udemy/widgets/en_ce_moment.dart';
import 'package:exo1_udemy/widgets/les_accompagnements.dart';
import 'package:exo1_udemy/widgets/mon_restaurant_le_plus_proche.dart';
import 'package:exo1_udemy/widgets/touche_sucre.dart';
import 'package:exo1_udemy/widgets/une_petite_soif.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final TextStyle textStyle = const TextStyle(
      color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold);
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            // color: ,
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.token),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MonRestaurantLePlusProche(),
            EnCeMoment(textStyle: textStyle),
            ChaudDevant(textStyle: textStyle),
            LesAccompagnements(textStyle: textStyle),
            UnePetiteSoif(textStyle: textStyle),
            ToucheSucre(textStyle: textStyle)
          ],
        ),
      ),
    );
  }
}
