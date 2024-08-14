import 'package:flutter/material.dart';
import 'burget_widget.dart';

class ChaudDevant extends StatelessWidget {
  final TextStyle textStyle;

  final List<Map<String, String>> listBurger = [
    {
      'title': 'Twins',
      'description': 'Le burger des jumeaux qui font la paire',
      'image': 'assets/images/twins.jpg'
    },
    {
      'title': 'Big Queen',
      'description': 'Pour celles qui portent la couronne à la maison',
      'image': 'assets/images/big-queen.jpg'
    },
    {
      'title': 'Egg Bacon',
      'description': 'Le burger des lève tôt',
      'image': 'assets/images/egg-bacon-burger.jpg'
    },
    {
      'title': 'Prince',
      'description': 'Le préféré des futurs rois',
      'image': 'assets/images/prince.jpg'
    },
    {
      'title': 'Cheese',
      'description': 'Le classique pour les fans de fromage',
      'image': 'assets/images/cheese.jpg'
    },
  ];
  ChaudDevant({super.key, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chaud Devant',
            style: textStyle,
          ),
          const SizedBox(height: 2),
          const Text(
            'Le meilleur de nos burgers à portée de clic',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  listBurger.length,
                  (index) => BurgetWidget(
                        burger: listBurger[index],
                        textStyle: textStyle,
                      )),
            ),
          )
        ],
      ),
    );
  }
}
