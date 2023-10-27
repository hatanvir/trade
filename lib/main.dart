import 'package:flutter/material.dart';
import 'package:tread/app/bindings/initial_bindings.dart';
import 'package:tread/app/core/values/app_colors.dart';

import 'package:get/get.dart';
import 'package:tread/app/data/shared_pref.dart';
import 'package:path_provider/path_provider.dart';

import 'app/routes/app_pages.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  runApp(
    GetMaterialApp(
      initialBinding: InitialBindings(),
      title: "Trade",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColor.primaryColor,
          titleTextStyle: TextStyle(color: AppColor.blackColor,fontSize: 18),
          elevation: 0
        )
      ),
    ),
  );
}
