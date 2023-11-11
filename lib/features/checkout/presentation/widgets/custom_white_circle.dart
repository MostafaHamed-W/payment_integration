import 'package:flutter/material.dart';

class RightWhiteCircle extends StatelessWidget {
  const RightWhiteCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.2,
      right: -20,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}

class LeftWhiteCircle extends StatelessWidget {
  const LeftWhiteCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.2,
      left: -20,
      child: const CircleAvatar(
        backgroundColor: Colors.white,
      ),
    );
  }
}
