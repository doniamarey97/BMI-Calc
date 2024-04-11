// import 'package:flutter/material.dart';

// class TestPicker extends StatefulWidget {
//   const TestPicker({super.key});

//   @override
//   State<TestPicker> createState() => _TestPickerState();
// }

// class _TestPickerState extends State<TestPicker> {
//   int _heightWheelController=7;
//   @override
//   Widget build(BuildContext context) {
//     return ListWheelScrollView(
//   controller: _heightWheelController,
//   overAndUnderCenterOpacity: 0.5,
//   useMagnifier: false,
//   magnification: 1,
//   diameterRatio: 4,
//   itemExtent: 50,
//   onSelectedItemChanged: (index) {
//     HapticFeedback.lightImpact();
//     int value = index + minHeight;
//     _tempHeight = value;
//   },
//   physics: FixedExtentScrollPhysics(),
//   children: [
//     for (var i = minHeight; i < maxHeight; i++)
//       Container(
//         width: MediaQuery.of(context).size.width / 4,
//         height: 50,
//         child: Center(child: Text("$i cm")),
//         decoration: BoxDecoration(
//           borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
//           color: Colors.white12,
//           border: Border.all(
//             color: Colors.green,
//             width: 3,
//           ),
//         ),
//       ),
//   ],
//   ),;
//   }
// }