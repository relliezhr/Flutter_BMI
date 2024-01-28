import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class bmiResult extends StatefulWidget {
  final double bmiValue;
  final int age;

  bmiResult({super.key, required this.bmiValue, required this.age});

  @override
  State<bmiResult> createState() => _bmiResultState();
}

class _bmiResultState extends State<bmiResult> {
  bool isLoading = false;
  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hasil BMI"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your BMI Result",
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
            const SizedBox(
              height: 10,
            ),
            PrettyGauge(
              gaugeSize: 300,
              minValue: 0,
              maxValue: 40,
              segments: [
                GaugeSegment("Berat Badan Kurang", 18.5, Colors.orange),
                GaugeSegment("Berat Badan Normal", 6.4, Colors.green),
                GaugeSegment("Berat Badan Berlebih", 5, Colors.blue),
                GaugeSegment("Anda Mengalami Obesitas", 10.1, Colors.deepPurple)
              ],
              valueWidget: Text(
                widget.bmiValue.toStringAsFixed(1),
                style: const TextStyle(fontSize: 40),
              ),
              currentValue: widget.bmiValue.toDouble(),
              needleColor: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              bmiStatus!,
              style: TextStyle(fontSize: 20, color: bmiStatusColor!),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              bmiInterpretation!,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(Duration(seconds: 1), () async {
                    Navigator.pop(context);
                  });
                  setState(() {
                    isLoading = false;
                  });
                },
                child: isLoading == true
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : const Text('HITUNG ULANG')),
          ],
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiValue > 30) {
      bmiStatus = "Obesitas";
      bmiInterpretation = "Ubah gaya hidup Anda untuk mengurangi obesitas!";
      bmiStatusColor = Colors.deepPurple;
    } else if (widget.bmiValue >= 25) {
      bmiStatus = "Berat Badan Berlebih";
      bmiInterpretation = "Ayo mulai olahraga!";
      bmiStatusColor = Colors.blue;
    } else if (widget.bmiValue >= 18.5) {
      bmiStatus = "Berat Badan Normal";
      bmiInterpretation = "Jaga pola hidup yang sehat!";
      bmiStatusColor = Colors.green;
    } else if (widget.bmiValue < 18.5) {
      bmiStatus = "Berat Badan Kurang";
      bmiInterpretation = "Ayo dapatkan berat badan yang seimbang!";
      bmiStatusColor = Colors.orange;
    }
  }
}
