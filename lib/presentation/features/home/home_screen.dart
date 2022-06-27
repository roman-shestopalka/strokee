import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/common/app_text_styles.dart';
import 'package:strokee/presentation/common/extensions/build_context_extensions.dart';
import 'package:table_calendar/table_calendar.dart';

//UI
import 'package:strokee/presentation/common/ui/caption_widget.dart';
import 'package:strokee/presentation/common/ui/ui_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: CaptionWidget(
                    text: 'Home',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    width: 390,
                    height: 390,
                    child: const Padding(
                      padding: EdgeInsets.all(30),
                      child: Calendar(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      UiCard(
                        headerName: 'Task',
                      ),
                      UiCard(
                        headerName: 'Note',
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.green),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        headerVisible: false,
        calendarStyle: const CalendarStyle(
          todayTextStyle: TextStyle(color: Colors.black, fontSize: 16),
          weekendTextStyle: TextStyle(color: AppColors.mainColor, fontSize: 16),
          defaultTextStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2040, 3, 14));
  }
}


//TODO: refactoring
//TODO: custom calendar
