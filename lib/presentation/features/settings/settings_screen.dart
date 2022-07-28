import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/common/app_text_styles.dart';
import 'package:strokee/presentation/common/ui/caption_widget.dart';
import 'package:strokee/presentation/common/widgets/home_container.dart';
import 'package:strokee/presentation/common/widgets/switch_button_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          MainContainer(
            width: 500,
            height: 350,
            widget: Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: CaptionWidget(text: 'Settings'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.grey,
                      size: 60,
                    ),
                  ),
                  const Text(
                    'Account Name',
                    style: AppTextStyles.subHeaderTextStyle,
                  ),
                  SizedBox(
                    width: 330,
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SettingsSwitch(
                            text: 'Dark Mode',
                            icon: Icon(
                              Icons.dark_mode_outlined,
                              color: AppColors.categoryItemColor,
                            ),
                          ),
                        ),
                        SettingsSwitch(
                          text: 'Notification',
                          icon: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.categoryItemColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 250,
            child: Column(
              children: const [
                SettingsElevatedButton(
                  buttonTitle: 'PRIVACY POLICY',
                  paddingTop: 50,
                ),
                SettingsElevatedButton(
                  buttonTitle: 'HELP AND FEEDBACK',
                  paddingTop: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Elevated Button
class SettingsElevatedButton extends StatelessWidget {
  final String buttonTitle;
  final double paddingTop;

  const SettingsElevatedButton({
    required this.buttonTitle,
    required this.paddingTop,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(200, 50),
            maximumSize: const Size(250, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            primary: AppColors.uiColor,
            surfaceTintColor: AppColors.uiColor,
            textStyle: AppTextStyles.defaultTextStyleWh,
            onPrimary: AppColors.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(buttonTitle),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}

class SettingsSwitch extends StatelessWidget {
  final String text;
  final Widget icon;
  const SettingsSwitch({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(padding: const EdgeInsets.only(right: 8), child: icon),
            Text(
              text,
              style: AppTextStyles.defaultTextStyleWh,
            ),
          ],
        ),
        const SwitchButtonWidget()
      ],
    );
  }
}
