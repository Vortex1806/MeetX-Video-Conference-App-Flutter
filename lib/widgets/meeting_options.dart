import 'package:flutter/material.dart';
import 'package:meetx/utils/colors.dart';

class MeetingOptions extends StatelessWidget {
  const MeetingOptions(
      {required this.onChanged,
      required this.isMute,
      required this.text,
      super.key});
  final String text;
  final bool isMute;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Switch.adaptive(value: isMute, onChanged: onChanged)
        ],
      ),
    );
  }
}
