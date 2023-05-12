import 'package:crossover_test/pallette.dart';
import 'package:crossover_test/router.dart';
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
      home: _Scaffold(),
      initialRoute: "/",
      getPages: [GetPage(name: "/", page: () => _Scaffold())],
      theme: ThemeData(
        primaryColor: primaryColor,
        highlightColor: whiteColor,
        buttonTheme:
            Theme.of(context).buttonTheme.copyWith(buttonColor: primaryColor),
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
      bottomNavigationBar: MyBottomNavigation(
        navigatorKey: navigatorKey,
      ),
    );
  }
}

class MyBottomNavigation extends StatefulWidget {
  final int navigatorKey;
  const MyBottomNavigation({required this.navigatorKey, super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Activity"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Bookmarks"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      onTap: (index) {
        // setState(() {
        //   _currentIndex = index;
        // });
        _currentIndex = index;

        switch (index) {
          case 0:
            Get.toNamed(Routes.home.route, id: widget.navigatorKey);
            break;
          case 1:
            Get.toNamed(Routes.discover.route, id: widget.navigatorKey);
            break;
          case 2:
            Get.toNamed(Routes.activity.route, id: widget.navigatorKey);
            break;
          case 3:
            Get.toNamed(Routes.bookmarks.route, id: widget.navigatorKey);
            break;
          case 4:
            Get.toNamed(Routes.profile.route, id: widget.navigatorKey);
            break;
        }
      },
    );
  }
}
