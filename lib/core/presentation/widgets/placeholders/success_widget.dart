import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {

  const SuccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle, color: Colors.green),
        ],
      ),
    );
  }
}