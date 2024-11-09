import 'package:flutter/material.dart';

class TopratedHeader extends StatelessWidget {
  const TopratedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: const Text(
            'Top Rated ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 204,
        ),
        Container(
          padding: const EdgeInsets.only(left: 12),
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
