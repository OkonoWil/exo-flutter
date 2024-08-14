import 'package:exo1_udemy/widgets/accompagnement_widget.dart';
import 'package:flutter/material.dart';

class LesAccompagnements extends StatelessWidget {
  final TextStyle textStyle;
  LesAccompagnements({super.key, required this.textStyle});
  final List<Map<String, String>> listAccompagnements = [
    {
      'title': 'Frites classique',
      'image': 'assets/images/fries.jpg',
    },
    {
      'title': 'Frites de patate douce',
      'image': 'assets/images/patate-douce.jpg',
    },
    {
      'title': 'Poutine',
      'image': 'assets/images/poutine.jpg',
    },
    {
      'title': 'Potatoes',
      'image': 'assets/images/potatoes.jpg',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              'Les accompagnements',
              style: textStyle,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            Card(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: List.generate(
                      listAccompagnements.length,
                      (index) => Column(
                            children: [
                              AccompagnementWidget(
                                  accompagnement: listAccompagnements[index]),
                              if (index < listAccompagnements.length - 1)
                                const Divider(
                                  endIndent: 0,
                                  thickness: 1.5,
                                )
                            ],
                          )),
                ),
              ),
            )
          ]),
    );
  }
}
