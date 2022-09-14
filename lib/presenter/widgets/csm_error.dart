import 'package:flutter/material.dart';

class CsmError extends StatelessWidget {
  const CsmError(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onPressed,})
      : super(key: key);
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: onPressed,
              icon: Icon(icon, size: 40,))
        ],
      ),
    );
  }
}
