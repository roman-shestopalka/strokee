import 'package:flutter/cupertino.dart';
import 'package:strokee/presentation/common/app_colors.dart';

class MainContainer extends StatelessWidget {
  final Widget widget;
  final double width;
  final double height;
  const MainContainer({
    required this.widget,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: AppColors.uiColor),
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: widget,
      ),
    );
  }
}
