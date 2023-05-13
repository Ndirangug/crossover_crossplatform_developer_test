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

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() async {
        //Get.put(await SharedPreferences.getInstance(), permanent: true);
        Get.put(Logger(), permanent: true);
      }),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => const _Scaffold())],
      themeMode: ThemeMode.dark,
      theme: ThemeData.light().copyWith(
        textTheme: Typography.englishLike2021.copyWith(
            bodyMedium: theme.textTheme.bodyMedium!
                .copyWith(color: Colors.black, fontFamily: 'SFProRounded')),
        extensions: <ThemeExtension<dynamic>>[
          palette.Pallette(
            normalText: Colors.white,
            disabledText: Colors.white.withOpacity(0.4),
            primary: const Color.fromRGBO(1, 30, 41, 1),
            primaryGradientColor1: const Color.fromRGBO(0, 29, 40, 1),
            primaryGradientColor2: const Color.fromRGBO(0, 66, 90, 1),
            accent: const Color.fromRGBO(40, 177, 143, 1),
            error: const Color.fromRGBO(1, 30, 41, 1),
            tertiary1: const Color.fromRGBO(220, 95, 95, 1),
            tertiary2: const Color.fromRGBO(251, 182, 104, 1),
            tertiary3: const Color.fromRGBO(255, 212, 73, 1),
            tertiary4: const Color.fromRGBO(22, 98, 79, 1),
            tertiary5: const Color.fromRGBO(31, 138, 112, 1),
          )
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: Typography.englishLike2021.copyWith(
            bodyMedium: theme.textTheme.bodyMedium!
                .copyWith(color: Colors.white, fontFamily: 'SFProRounded')),
        extensions: <ThemeExtension<dynamic>>[
          palette.Pallette(
            normalText: Colors.white,
            disabledText: Colors.white.withOpacity(0.4),
            primary: const Color.fromRGBO(1, 30, 41, 1),
            primaryGradientColor1: const Color.fromRGBO(0, 29, 40, 1),
            primaryGradientColor2: const Color.fromRGBO(0, 66, 90, 1),
            accent: const Color.fromRGBO(40, 177, 143, 1),
            error: const Color.fromRGBO(1, 30, 41, 1),
            tertiary1: const Color.fromRGBO(220, 95, 95, 1),
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
