import 'package:exo1_udemy/widgets/boisson_widget.dart';
import 'package:flutter/material.dart';

class UnePetiteSoif extends StatelessWidget {
  final TextStyle textStyle;
  UnePetiteSoif({super.key, required this.textStyle});

  final List<Map<String, String>> boissons = [
    {
      'title': 'Le classique',
      'image': 'assets/images/classic-cola.jpg',
    },
    {
      'title': 'A l\'orange',
      'image': 'assets/images/orange-soda.jpg',
    },
    {
      'title': 'Eau gazeuse',
      'image': 'assets/images/sparkling.jpg',
    },
    {
      'title': 'Goût fraise',
      'image': 'assets/images/strawberry-soda.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            'Une petite soif',
            style: textStyle,
          ),
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(boissons.length,
                    (index) => BoissonWidget(boisson: boissons[index])),
              ),
            ),
          )
        ],
      ),
    );
  }
}
