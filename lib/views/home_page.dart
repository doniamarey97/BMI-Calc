import 'package:bmi_app/contants.dart';
import 'package:bmi_app/views/result_page.dart';
import 'package:bmi_app/widgets/custom_age.dart';
import 'package:bmi_app/widgets/custom_card.dart';
import 'package:bmi_app/widgets/custom_height.dart';
import 'package:bmi_app/widgets/custom_weight.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _age = 30;
  double height = 140.0;
  bool isMail = true;
  int weight = 52;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Gender",
                      style: TextStyle(fontFamily: 'Raleway', fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMail = true;
                            });
                          },
                          child: CustomCard(
                            image: 'assets/images/male.png',
                            text: 'Male',
                            color: isMail
                                ? const Color(0xffDFE9F9)
                                : const Color(0xffD9D9D9),
                            borderColor: isMail
                                ? kprimaryColor
                                : const Color(0xffD9D9D9),
                          ),
                        )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMail = false;
                            });
                          },
                          child: CustomCard(
                            image: 'assets/images/female.png',
                            text: 'Female',
                            color: isMail
                                ? const Color(0xffD9D9D9)
                                : const Color(0xffDFE9F9),
                            borderColor: isMail
                                ? const Color(0xffD9D9D9)
                                : kprimaryColor,
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: CustomHeight(
                onChanged: (dynamic value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: CustomAgeItem(
                        onChange: (ageVal) {
                          _age = ageVal;
                        },
                        initValue: 10,
                        min: 0,
                        max: 100)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(child: CustomWeight(
                  onChanged: (dynamic value) {
                    setState(() {
                      weight = value;
                    });
                  },
                ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: kprimaryColor,
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CALCULATE BMI",
                          style: TextStyle(
                              fontFamily: kfontFamily,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        height: height,
                        weight: weight,
                        age: _age,
                        isMail: isMail,
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ));
  }
}
