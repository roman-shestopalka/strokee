import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/common/ui/caption_widget.dart';
import 'package:strokee/presentation/common/ui/ui_cards.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: CaptionWidget(text: 'Archive'),
          ),
          UiLine(),
          UiCard(headerName: 'Tasks')
        ],
      ),
    );
  }
}

// UI Line
class UiLine extends StatelessWidget {
  const UiLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
          width: 250,
          height: 5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.uiColor)),
    );
  }
}
