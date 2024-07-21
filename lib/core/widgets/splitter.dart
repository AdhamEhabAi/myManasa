import 'package:flutter/material.dart';

class Splitter extends StatelessWidget {
  const Splitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white
      ),
    );
  }
}
