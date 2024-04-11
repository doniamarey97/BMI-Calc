import 'package:bmi_app/contants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomHeight extends StatefulWidget {
  const CustomHeight({super.key, required this.onChanged});
  final void Function(dynamic)? onChanged;

  @override
  State<CustomHeight> createState() => _CustomHeightState();
}

class _CustomHeightState extends State<CustomHeight> {
  double height = 140.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Height(cm)",
          style: TextStyle(fontFamily: kfontFamily, fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height:110,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(24)),
          child: SfSliderTheme(
            data: const SfSliderThemeData(
              tooltipBackgroundColor: kprimaryColor,
                 activeTickColor:kprimaryColor,
                 tickSize: Size(2.0, 20.0),
                  minorTickSize: Size(2.0, 10.0),
                  activeMinorTickColor: kprimaryColor,
          
                
              activeLabelStyle:TextStyle(
                fontFamily: 'Raleway',
                fontSize: 15, 
                fontWeight: FontWeight.bold, 
                color: Colors.black, ),
                inactiveLabelStyle:TextStyle(
                fontFamily: 'Raleway',
                fontSize: 15, 
                fontWeight: FontWeight.bold, 
                color: Colors.black, )
              //  labelTextStyle: TextStyle(
              //   fontFamily: 'Raleway', // Change font family here
              //   fontSize: 12, // Change font size here
              //   fontWeight: FontWeight.bold, // Change font weight here
              //   color: Colors.black, // Change text color here
              // ),
            ),
            child: SfSlider(
              activeColor: kprimaryColor,
              inactiveColor: Color(0xffA8AAAC),
              min: 100.0,
              max: 220.0,
              value: height,
              interval: 15,
              stepSize: 1,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              tooltipShape: const SfPaddleTooltipShape(),
              minorTicksPerInterval: 1,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
                widget.onChanged?.call(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
