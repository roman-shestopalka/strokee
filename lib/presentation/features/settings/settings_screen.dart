import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/ui/caption_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: CaptionWidget(text: 'Settings'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              width: 350,
              height: 350,
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.grey,
                        size: 60,
                      ),
                    ),
                    const Text(
                      'Account Name',
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 69, 69, 69)),
                    ),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: const [],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
