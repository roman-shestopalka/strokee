import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_colors.dart';

class SwitchButtonWidget extends StatefulWidget {
  const SwitchButtonWidget({Key? key}) : super(key: key);

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeColor: AppColors.mainColor,
    );
  }
}
