import 'package:flutter/material.dart';

class ComingSoonHeader extends StatelessWidget {
  const ComingSoonHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: const Text(
            'Coming Soon ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.only(right: 12),
          child: const Text(
            'see more ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
}
