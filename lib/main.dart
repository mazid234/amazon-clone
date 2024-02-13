import 'package:amazon_clone_app/global_variables.dart';
import 'package:amazon_clone_app/mvc/binding/product_binding.dart';
import 'package:amazon_clone_app/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mvc/view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.greybackgroundColor,
          appBarTheme: const AppBarTheme(elevation: 0),
          colorScheme:
              ColorScheme.light(primary: GlobalVariables.secondaryColor),
          iconTheme: IconThemeData(color: GlobalVariables.iconsColor)),
      // onGenerateRoute: (settings) => generateRoute(settings),
      initialRoute: Routes.MyHomePage,
      getPages: getPages,
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.AuthScreen);
                  Get.toNamed(Routes.AuthScreen);
                },
                child: Text('Authscreen'))
          ],
        ),
      ),
    );
  }
}
