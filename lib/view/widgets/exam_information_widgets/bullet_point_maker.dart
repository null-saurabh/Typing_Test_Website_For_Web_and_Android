import 'package:flutter/material.dart';

class BulletPoints extends StatelessWidget {
  const BulletPoints({
    super.key,
    required this.stringPoints,
  });

  final List<String> stringPoints;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stringPoints.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("  •", style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "${stringPoints[index]}.",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
