import 'package:flutter/cupertino.dart';

import 'package:strokee/presentation/common/app_text_styles.dart';

class CaptionWidget extends StatelessWidget {
  final String text;
  const CaptionWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppTextStyles.headerTextStyle,
      ),
    );
  }
}
