import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class genderWidget extends StatefulWidget {
  final Function(int) onChange;

  genderWidget({super.key, required this.onChange});

  @override
  State<genderWidget> createState() => _genderWidgetState();
}

class _genderWidgetState extends State<genderWidget> {
  int gender = 1;

  final ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      topColor: Colors.redAccent[200]!,
      backColor: Colors.red,
      borderRadius: BorderRadius.circular(20));

  final ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      topColor: Colors.white,
      backColor: Colors.redAccent[200]!,
      borderRadius: BorderRadius.circular(20));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            border: Border.all(color: Colors.red),
            style: gender == 1 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                gender = 1;
              });
              widget.onChange(gender);
            },
            onUnSelected: () {},
            selected: gender == 1,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/male.png",
                  width: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Laki-Laki")
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          ChoiceChip3D(
            border: Border.all(color: Colors.red),
            style: gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                gender = 2;
              });
              widget.onChange(gender);
            },
            onUnSelected: () {},
            selected: gender == 2,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/female.png",
                  width: 50,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("Perempuan")
              ],
            ),
          )
        ],
      ),
    );
  }
}
