import 'package:flutter/material.dart';

class BoissonWidget extends StatelessWidget {
  final Map<String, String> boisson;
  const BoissonWidget({super.key, required this.boisson});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(boisson['image']!), fit: BoxFit.cover)),
        child: Text(
          boisson['title']!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.pink, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
