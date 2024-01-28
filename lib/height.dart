import 'dart:math';

import 'package:flutter/material.dart';

class heightWidget extends StatefulWidget {
  final Function(int) onChange;

  const heightWidget({super.key, required this.onChange});

  @override
  State<heightWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<heightWidget> {
  int height = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            "Tinggi Badan",
            style: TextStyle(fontSize: 25, color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                height.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              SizedBox(
                width: 8,
              ),
              const Text(
                "cm",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              )
            ],
          ),
          Slider(
            min: 0,
            max: 220,
            value: height.toDouble(),
            thumbColor: Colors.black,
            onChanged: (value) {
              setState(() {
                height = value.toInt();
              });
              widget.onChange(height);
            },
          )
        ],
      ),
    );
  }
}
