import 'dart:math';

import 'package:bmi_app/age_weight.dart';
import 'package:bmi_app/bmi_result.dart';
import 'package:bmi_app/gender.dart';
import 'package:bmi_app/height.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int gender = 0;
  int height = 100;
  int _age = 30;
  int weight = 50;
  double _bmiValue = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI-ku'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              genderWidget(
                onChange: (genderVal) {
                  gender = genderVal;
                },
              ),
              heightWidget(
                onChange: (heightVal) {
                  height = heightVal;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ageWeightWidget(
                      onChange: (ageVal) {
                        setState(() {
                          _age = ageVal;
                        });
                      },
                      title: "Umur (tahun)",
                      initValue: 30,
                      min: 0,
                      max: 100),
                  ageWeightWidget(
                      onChange: (weightVal) {
                        setState(() {
                          weight = weightVal;
                        });
                      },
                      title: "Berat Badan (kg)",
                      initValue: 50,
                      min: 0,
                      max: 200),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        backgroundColor: Colors.red),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(Duration(seconds: 1), () async {
                        calculateBMI();
                        await Navigator.push(
                            context,
                            PageTransition(
                                child:
                                    bmiResult(bmiValue: _bmiValue, age: _age),
                                type: PageTransitionType.fade));
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
                        : const Text('HITUNG')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  calculateBMI() {
    setState(() {
      _bmiValue = weight / pow(height / 100, 2);
    });
  }
}
