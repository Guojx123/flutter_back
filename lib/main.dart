import 'dart:io';

import 'package:back/Pages/easeImport.dart';
import 'package:back/Pages/providercategory.dart';
import 'package:back/Utils/navigatormanager.dart';
import 'package:back/Widgets/notfound.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() => realRunApp();

void realRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 竖屏
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => 1008),
        ChangeNotifierProvider(create: (_) => ChangeNotifyModel()),
        ValueListenableProvider<ValueNotifyModel>(
          create: (_) => ValueNotifyModelWrapper(ValueNotifyModel(0)),
          updateShouldNotify: (previous, current) =>
              previous.value != current.value,
        ),
        StreamProvider<int>(
          create: (_) => ProviderStream().stream,
          initialData: 0,
        ),
        FutureProvider(create: (_) => providerFuture()),
        ChangeNotifierProvider(create: (_) => SelectorModel()),
      ],
      child: MyApp(),
    ),
  );
}

SystemUiOverlayStyle setNavigationBarTextColor(bool light) {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: null,
    statusBarIconBrightness: light ? Brightness.light : Brightness.dark,
    statusBarBrightness: light ? Brightness.dark : Brightness.light,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      // 在组件渲染之后，再覆写状态栏颜色
      // 如果使用了APPBar，则需要修改brightness属性
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return GetMaterialApp(
      home: MaterialApp(
        title: 'Back',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(title: 'Back'),
        onUnknownRoute: (RouteSettings setting) {
          return MaterialPageRoute(builder: (context) => NotFoundWidget());
        },
        navigatorKey: RouteManager.navigatorKey,
        navigatorObservers: [NavigatorManager.getInstance()],
      ),
    );
  }
}
