import 'package:flutter/material.dart';

import 'package:strokee/data/hive/hive_model/task_form_widget_model.dart';

import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/common/app_text_styles.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final model = TaskWidgetModel();
  @override
  Widget build(BuildContext context) {
    return TaskWidgetModelProvider(
        model: model, child: const TaskModalWidgetBody());
  }
}

class TaskModalWidgetBody extends StatelessWidget {
  const TaskModalWidgetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> _selections = List.generate(3, (index) => false);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff101010), Color.fromARGB(0, 156, 156, 156)])),
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 300,
          child: FloatingActionButton(
            onPressed: () =>
                TaskWidgetModelProvider.read(context)?.model.taskSave(context),
            backgroundColor: AppColors.mainColor,
            child: const Icon(Icons.add_task),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 45, right: 45),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                // Title box
                const TextFieldWidget(
                  width: 350,
                  height: 60,
                  hintText: 'Enter Your Title',
                  maxLine: 1,
                ),

                // Description box
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: TextFieldWidget(
                    height: 150,
                    width: 350,
                    hintText: 'Enter Description...',
                    maxLine: 5,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: TaskCustomWidget(
                    name: 'Priority',
                    widget: Icon(
                      Icons.radio_button_checked_outlined,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: TaskCustomWidget(
                      name: 'Time',
                      widget: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColors.uiColor)),
                        onPressed: () {},
                        child: const Icon(
                          Icons.more_time,
                          color: AppColors.mainColor,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Category',
                      style: AppTextStyles.subHeaderTextStyle,
                    ),
                  ),
                ),

                ToggleButtons(
                  children: [
                    Icon(Icons.travel_explore),
                    Icon(Icons.money),
                    Icon(Icons.upgrade),
                  ],
                  isSelected: _selections,
                  selectedColor: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TaskCustomWidget extends StatelessWidget {
  final String name;
  final Widget widget;
  const TaskCustomWidget({
    required this.name,
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppTextStyles.subHeaderTextStyle,
        ),
        widget,
      ],
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  final int maxLine;

  const TextFieldWidget({
    required this.height,
    required this.width,
    required this.hintText,
    required this.maxLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: const Color.fromARGB(173, 47, 47, 47),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
          child: TextField(
            maxLines: maxLine,
            style: AppTextStyles.defaultTextStyle,
            cursorColor: AppColors.mainColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: AppTextStyles.defaultTextStyle),
            onChanged: (value) =>
                TaskWidgetModelProvider.read(context)?.model.titleName = value,
            onEditingComplete: () =>
                TaskWidgetModelProvider.read(context)?.model.taskSave(context),
          ),
        ));
  }
}
