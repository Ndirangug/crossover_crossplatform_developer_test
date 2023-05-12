import 'package:crossover_test/pallette.dart' as palette;
import 'package:crossover_test/router.dart';
import 'package:crossover_test/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() async {
        //Get.put(await SharedPreferences.getInstance(), permanent: true);
        Get.put(Logger(), permanent: true);
      }),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const _Scaffold())],
      theme: ThemeData(
        primaryColor: palette.maastrichBlue,
        highlightColor: palette.white,
        buttonTheme: Theme.of(context)
            .buttonTheme
            .copyWith(buttonColor: palette.maastrichBlue),
        fontFamily: 'SFProRounded',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 12.0, fontFamily: 'SFProRounded'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({Key? key}) : super(key: key);
  final navigatorKey = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(navigatorKey),
        initialRoute: Routes.home.route,
        onGenerateRoute: (settings) => Routes.getPage(settings),
      ),
      bottomNavigationBar: BottomNavbar(
        navigatorKey: navigatorKey,
      ),
    );
  }
}
