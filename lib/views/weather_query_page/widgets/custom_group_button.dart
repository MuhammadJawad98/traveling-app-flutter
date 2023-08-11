// import 'package:flutter/material.dart';
// import 'package:traveling_app_flutter/widgets/custom_sized_box.dart';

// class CustomTextButton extends StatelessWidget {
//   final double height;
//   final double width;
//   final Widget? icon;
//   final int index;
//   final String buttonText;
//   final Color buttonColor;
//   final Color fontColor;
//   final VoidCallback onTab;
//   final double radius;
//   final double? fontSize;
//   const CustomTextButton(
//       {super.key,
//       required this.height,
//       required this.width,
//       this.icon,
//       required this.index,
//       required this.onTab,
//       required this.buttonText,
//       required this.buttonColor,
//       required this.radius,
//       required this.fontSize,
//       this.fontColor = Colors.white});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(radius),
//       color: buttonColor,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(radius),
//         onTap: onTab,
//         child: Container(
//           decoration:
//               BoxDecoration(borderRadius: BorderRadius.circular(radius)),
//           height: height,
//           width: width,
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   textAlign: TextAlign.center,
//                   buttonText,
//                   style: TextStyle(color: fontColor, fontSize: fontSize),
//                 )
//               ]),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:traveling_app_flutter/utils/media_query.dart';

class GroupButton extends StatefulWidget {
  final List<String> labels;
  final ValueChanged<int> onPressed;

  GroupButton({required this.labels, required this.onPressed});

  @override
  _GroupButtonState createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.labels.length, (index) {
        bool isSelected = index == _selectedIndex;
        return Container(
          width: GetScreenSize.getScreenWidth(context) * 0.25,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _selectedIndex = index;
                widget.onPressed(index);
              });
            },
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                isSelected ? Colors.blue : Colors.white,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: isSelected ? Colors.white : Colors.grey,
                      width: GetScreenSize.getScreenWidth(context) * 0.002,
                    )),
              ),
            ),
            child: Text(widget.labels[index],
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
          ),
        );
      }),
    );
  }
}
