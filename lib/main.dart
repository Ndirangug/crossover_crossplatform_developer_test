import 'package:crossover_test/api.dart';
import 'package:crossover_test/controllers/following_controller.dart';
import 'package:crossover_test/controllers/for_you_controller.dart';
import 'package:crossover_test/controllers/home_page_controller.dart';
import 'package:crossover_test/controllers/screen_time_controller.dart';
import 'package:crossover_test/pallette.dart' as palette;
import 'package:crossover_test/router.dart';
import 'package:crossover_test/widgets/bottom_navbar/bottom_navbar.dart';
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

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(Logger(), permanent: true);
        Get.put(Api(), permanent: true);
        Get.put(FollowingController(), permanent: true);
        Get.put(ForYouController(), permanent: true);
        Get.put(ScreenTimeController(), permanent: true);
        Get.put(HomePageController(), permanent: true);
      }),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const _Scaffold())],
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color.fromRGBO(213, 234, 242, 1),
        textTheme: Typography.englishLike2021.copyWith(
            bodyMedium: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.black,
                fontFamily: 'SFProRounded',
                fontWeight: FontWeight.w400)),
        extensions: <ThemeExtension<dynamic>>[
          palette.Pallette(
            normalText: Colors.black,
            disabledText: Colors.black.withOpacity(0.4),
            primary: const Color.fromRGBO(213, 234, 242, 1),
            primaryGradientColor1: const Color.fromRGBO(213, 234, 242, 1),
            primaryGradientColor2: const Color.fromRGBO(239, 247, 250, 1),
            accent: const Color.fromRGBO(31, 138, 112, 1),
            error: const Color.fromRGBO(216, 78, 78, 1),
            tertiary1: const Color.fromRGBO(241, 125, 35, 1),
            tertiary2: const Color.fromRGBO(251, 182, 104, 1),
            tertiary3: const Color.fromRGBO(255, 212, 73, 1),
            tertiary4: const Color.fromRGBO(22, 98, 79, 1),
            tertiary5: const Color.fromRGBO(31, 138, 112, 1),
          )
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromRGBO(1, 30, 41, 1),
        textTheme: Typography.englishLike2021.copyWith(
            bodyMedium: theme.textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontFamily: 'SFProRounded',
                fontWeight: FontWeight.w400)),
        extensions: <ThemeExtension<dynamic>>[
          palette.Pallette(
            normalText: Colors.white,
            disabledText: Colors.white.withOpacity(0.4),
            primary: const Color.fromRGBO(1, 30, 41, 1),
            primaryGradientColor1: const Color.fromRGBO(0, 29, 40, 1),
            primaryGradientColor2: const Color.fromRGBO(0, 66, 90, 1),
            accent: const Color.fromRGBO(40, 177, 143, 1),
            error: const Color.fromRGBO(220, 95, 95, 1),
            tertiary1: const Color.fromRGBO(241, 125, 35, 1),
            tertiary2: const Color.fromRGBO(251, 182, 104, 1),
            tertiary3: const Color.fromRGBO(255, 212, 73, 1),
            tertiary4: const Color.fromRGBO(22, 98, 79, 1),
            tertiary5: const Color.fromRGBO(31, 138, 112, 1),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Get.find<ScreenTimeController>().timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        Get.find<ScreenTimeController>().resumeTimer();
        break;

      case AppLifecycleState.paused:
        Get.find<ScreenTimeController>().pauseTimer();
        break;
      case AppLifecycleState.detached:
        Get.find<ScreenTimeController>().pauseTimer();
        break;
      case AppLifecycleState.inactive:
        Get.find<ScreenTimeController>().pauseTimer();
    }
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
