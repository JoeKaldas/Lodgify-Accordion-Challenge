import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'ui/screens/tasks_screen.dart';
import 'utils/consts.dart';
import 'utils/router_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lodgify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: kColorWhite,
          primarySwatch: Colors.red,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            color: kColorBlack,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 26,
            color: kColorBlack,
          ),
          bodyText1: TextStyle(
            fontSize: 13,
            color: kColorBlack,
          ),
        ),
      ),
      initialRoute: TasksScreen.routeName,
      getPages: RouterPages.route,
    );
  }
}
