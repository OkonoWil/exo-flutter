import 'package:flutter/material.dart';

class AccompagnementWidget extends StatelessWidget {
  final Map<String, String> accompagnement;
  const AccompagnementWidget({super.key, required this.accompagnement});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(accompagnement['image']!),
            radius: 50,
          ),
          Text(
            accompagnement['title']!,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
