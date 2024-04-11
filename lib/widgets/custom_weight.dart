import 'package:bmi_app/contants.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomWeight extends StatefulWidget {
  const CustomWeight({super.key, required this.onChanged});
  final void Function(dynamic) onChanged;
  @override
  State<CustomWeight> createState() => _CustomWeightState();
}

//(value) => setState(() => weight = value)
class _CustomWeightState extends State<CustomWeight> {
  dynamic weight = 52;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Weight(kg)",
          style: TextStyle(fontFamily: kfontFamily, fontSize: 18),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(20)),
            height: 85,
            width: 200,
            child: Stack(
              children: [
                Center(
                  child: NumberPicker(
                    value: weight,
                    minValue: 0,
                    maxValue: 150,
                    step: 1,
                    itemHeight: 45,
                    itemWidth: 45,
                    axis: Axis.horizontal,
                    onChanged: (value) {
                      setState(() {
                        weight = value;
                      });
                       widget.onChanged?.call(value);
                    },
                    textStyle: const TextStyle(
                        fontFamily: kfontFamily,
                        fontSize: 20,
                        color: Colors.grey),
                    selectedTextStyle:
                        const TextStyle(fontSize: 30, fontFamily: kfontFamily),
                  ),
                ),
                Positioned(
                  left: 70, // Adjust the left position of the triangle
                  top: 0, // Adjust the top position of the triangle
                  child: CustomPaint(
                    size: const Size(20, 20), // Adjust the size of the triangle
                    painter: _TrianglePainter(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = kprimaryColor // Set the color of the triangle
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(size.width / 2, size.height) // Move to the bottom center
      ..lineTo(size.width, 0) // Draw to the top right
      ..lineTo(0, 0) // Draw to the top left
      ..close(); // Close the path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
