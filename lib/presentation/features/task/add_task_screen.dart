import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:strokee/data/hive/hive_model/task_form_widget_model.dart';
import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/common/app_text_styles.dart';
import 'package:strokee/presentation/common/widgets/list_builder_widget.dart';

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

class TaskModalWidgetBody extends StatefulWidget {
  const TaskModalWidgetBody({Key? key}) : super(key: key);

  @override
  State<TaskModalWidgetBody> createState() => _TaskModalWidgetBodyState();
}

class _TaskModalWidgetBodyState extends State<TaskModalWidgetBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff101010), Color(0x009C9C9C)])),
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 300,
          child: FloatingActionButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                return Navigator.pop(context);
              }
              TaskWidgetModelProvider.read(context)?.model.taskSave(context);
            },
            backgroundColor: AppColors.mainColor,
            child: const Icon(Icons.add_task),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    surfaceTintColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              // Title box
              SizedBox(
                width: 350,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const TextFieldWidget(
                        hintText: 'Enter Your Title',
                        maxLine: 1,
                        errorTextField: 'Please enter your title !',
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TextFieldWidget(
                          hintText: 'Enter Description...',
                          maxLine: 5,
                          errorTextField: 'Please enter your descroption !',
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: TaskCustomWidget(
                            name: 'Priority',
                            widget: Icon(
                              Icons.priority_high_outlined,
                              color: AppColors.mainColor,
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TaskCustomWidget(
                          name: 'Time',
                          widget: Icon(
                            Icons.today_outlined,
                            color: AppColors.mainColor,
                          ),
                        ),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: DefaultTabController(
                            length: 3,
                            child: Column(
                              children: [
                                ButtonsTabBar(
                                    backgroundColor: AppColors.mainColor,
                                    unselectedBackgroundColor:
                                        AppColors.textFieldColor,
                                    splashColor: AppColors.splashColor,
                                    labelStyle:
                                        AppTextStyles.defaultTextStyleWh,
                                    unselectedLabelStyle:
                                        AppTextStyles.defaultTextStyleGr,
                                    tabs: const [
                                      Tab(
                                        icon: Icon(Icons.travel_explore),
                                        text: 'Travel',
                                      ),
                                      Tab(
                                        icon: Icon(Icons.money),
                                        text: 'Finance',
                                      ),
                                      Tab(
                                        icon: Icon(Icons.person_outlined),
                                        text: 'Me',
                                      )
                                    ])
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ), // Description box
            ],
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
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.uiColor)),
            onPressed: () {},
            child: widget),
      ],
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final int maxLine;
  final String errorTextField;

  const TextFieldWidget({
    required this.hintText,
    required this.maxLine,
    required this.errorTextField,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15),
      child: TextFormField(
        validator: (value) {
          if (value!.isNotEmpty) {
            return null;
          } else if (value.isEmpty) {
            return widget.errorTextField;
          }
          return null;
        },
        maxLines: widget.maxLine,
        style: AppTextStyles.defaultTextStyleGr,
        cursorColor: AppColors.mainColor,
        decoration: InputDecoration(
            fillColor: AppColors.uiColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            hintText: widget.hintText,
            errorStyle: AppTextStyles.errorTextStyle,
            hintStyle: AppTextStyles.defaultTextStyleGr),
        onChanged: (value) =>
            TaskWidgetModelProvider.read(context)?.model.titleName = value,
        onEditingComplete: () =>
            TaskWidgetModelProvider.read(context)?.model.taskSave(context),
      ),
    );
  }
}
