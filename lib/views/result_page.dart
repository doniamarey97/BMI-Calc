import 'package:bmi_app/contants.dart';
import 'package:bmi_app/views/home_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage(
      {super.key,
      required this.age,
      required this.height,
      required this.isMail,
      required this.weight});
  final int age;
  final double height;
  final bool isMail;
  final int weight;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool a1 = false;
  bool a2 = false;
  bool a3 = false;
  bool a4 = false;
  dynamic bmi = 0;
  @override
  Widget build(BuildContext context) {
    bmi = (widget.weight / ((widget.height * 0.01) * (widget.height * 0.01)));
    String bmiformatted = bmi.toStringAsFixed(2);
    if (bmi < 18.5) {
      a1 = true;
    }
    if (bmi >= 18.5 && bmi < 25) {
      a2 = true;
    }
    if (bmi >= 25 && bmi < 30) {
      a3 = true;
    }
    if (bmi >= 30) {
      a4 = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Back",
          style: TextStyle(fontFamily: kfontFamily),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Result",
              style: TextStyle(
                  fontFamily: kfontFamily,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
                child: Text("Your BMI is",
                    style: TextStyle(
                        fontFamily: kfontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kprimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ("$bmiformatted"),
                        style: const TextStyle(
                            fontFamily: kfontFamily,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      const Text(
                        "kg/m2",
                        style: TextStyle(
                            fontFamily: kfontFamily,
                            fontSize: 16,
                            color: Color(0xffD1D5DB)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                  a1
                      ? "(Underweight)"
                      : a2
                          ? "(Normal Weight)"
                          : a3
                              ? "(OverWeight)"
                              : a4
                                  ? "(Obese)"
                                  : "(Extremely Obese)",
                  style: const TextStyle(
                    fontFamily: kfontFamily,
                    fontSize: 22,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 110,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffD1D5DB),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16),
                    child: Column(
                      children: [
                        Image.asset(
                          widget.isMail == true
                              ? 'assets/images/male.png'
                              : 'assets/images/female.png',
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.isMail ? "Male" : "Female",
                          style: const TextStyle(
                              fontFamily: kfontFamily,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 18),
                    child: Column(
                      children: [
                        Text(
                          widget.age.toString(),
                          style: const TextStyle(
                              fontFamily: kfontFamily,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          'Age',
                          style: TextStyle(
                              fontFamily: kfontFamily,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 16),
                    child: Column(children: [
                      Text(
                        (widget.height).toInt().toString(),
                        style: const TextStyle(
                            fontFamily: kfontFamily,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Height',
                        style: TextStyle(
                            fontFamily: kfontFamily,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 16),
                    child: Column(children: [
                      Text(
                        widget.weight.toString(),
                        style: const TextStyle(
                            fontFamily: kfontFamily,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Weight',
                        style: TextStyle(
                            fontFamily: kfontFamily,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffD1D5DB),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  a1
                      ? underWeight
                      : a2
                          ? normalWeight
                          : a3
                              ? overWeight
                              : a4
                                  ? obese
                                  : extremlyObsity,
                  style: const TextStyle(fontFamily: kfontFamily, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "TRY AGAIN  ",
                              style: TextStyle(
                                  fontFamily: kfontFamily,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.refresh,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return const HomePage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
