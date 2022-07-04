import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/common/ui/ui_cards.dart';
import 'package:strokee/presentation/features/task/add_task_screen.dart';
import 'package:table_calendar/table_calendar.dart';

//UI
import 'package:strokee/presentation/common/ui/caption_widget.dart';
// import 'package:strokee/presentation/common/ui/ui_cards.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        color: const Color.fromARGB(225, 47, 47, 47)),
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
                      scrollDirection: Axis.horizontal,
                      children: const [
                        UiCard(headerName: 'Task'),
                        UiCard(headerName: 'Notes')
                      ],
                    )),
                const TaskBtn()
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Task adding button
class TaskBtn extends StatelessWidget {
  const TaskBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const AddTaskScreen())));
          },
          backgroundColor: const Color(0xFF2F2F2F),
          child: const Icon(
            Icons.task_alt,
            color: Color(0xFFD42AFF),
          ),
        ),
      ),
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
            todayTextStyle: TextStyle(color: Colors.white, fontSize: 16),
            weekendTextStyle: TextStyle(color: Color(0xFFB5B5B5), fontSize: 16),
            defaultTextStyle: TextStyle(color: Color(0xFFB5B5B5), fontSize: 16),
            outsideTextStyle: TextStyle(color: Color(0xFFCD43F0))),
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2040, 3, 14));
  }
}


//TODO: refactoring
//TODO: custom calendar
