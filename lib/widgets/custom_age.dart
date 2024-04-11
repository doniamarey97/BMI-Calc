import 'package:bmi_app/contants.dart';
import 'package:flutter/material.dart';

class CustomAgeItem extends StatefulWidget {
  const CustomAgeItem(
      {super.key,
      required this.initValue,
      required this.min,
      required this.max,
      required this.onChange});
  final int initValue;
  final int min;
  final int max;
  final Function(int) onChange;
  @override
  State<CustomAgeItem> createState() => _CustomAgeItemState();
}

class _CustomAgeItemState extends State<CustomAgeItem> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Age",
          style: TextStyle(fontFamily: kfontFamily, fontSize: 18),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              height: 85,
              width: 200,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            height: 24,
                            width: 24,
                            child: const Center(
                                child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 20,
                            )))),
                    onTap: () {
                      setState(() {
                        if (counter > widget.min) {
                          counter--;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 30,fontFamily: kfontFamily
                        ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            height: 24,
                            width: 24,
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 20,
                            )))),
                    onTap: () {
                      setState(() {
                        if (counter < widget.max) {
                          counter++;
                        }
                      });
                      widget.onChange(counter);
                    },
                  ),
                ],
              )),
        )
      ],
    );
  }
}
