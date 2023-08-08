import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final TextStyle defaultStyle;
  final List<TextSpan> textSpans;

  const CustomRichText({
    super.key,
    required this.text,
    required this.defaultStyle,
    required this.textSpans,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          TextSpan(text: text),
          ...textSpans,
        ],
      ),
    );
  }
}
