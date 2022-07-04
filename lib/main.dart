import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:strokee/presentation/strokee_app/strokee_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const StrokeeApp());
}
