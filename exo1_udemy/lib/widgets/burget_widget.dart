import 'package:flutter/material.dart';

class BurgetWidget extends StatelessWidget {
  final Map<String, String> burger;
  final TextStyle textStyle;
  const BurgetWidget(
      {super.key, required this.burger, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Container(
          height: 300,
          width: 300,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(burger['image']!),
                        fit: BoxFit.cover,
                        scale: 0.75)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Text(
                      burger['title']!,
                      style: textStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      burger['description']!,
                      style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
