import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/ui/ui_cards.dart';

class ListBuildWidget extends StatefulWidget {
  late final ListBuild listBuild;

  @override
  State<ListBuildWidget> createState() => _ListBuildWidgetState();
}

class ListBuild {
  static int listBuilder = 1;
}

class _ListBuildWidgetState extends State<ListBuildWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return const UiCard(headerName: 'Task');
          },
          itemCount: ListBuild.listBuilder,
        ));
  }
}
