import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:technicaltest_danafix/app/modules/widgets/network_sensitive.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';
import 'package:technicaltest_danafix/app/utils/network/connectivity_service.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    StreamProvider(
      initialData: ConnectivityStatus.mobile,
      create: (context) => ConnectivityService().connectivityController.stream,
      child: GetMaterialApp(
        title: "Technical Test DanaFix",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black)),
        ),
      ),
      builder: (context, child) {
        return MediaQuery(
            data: const MediaQueryData(),
            child: MaterialApp(home: NetworkSensitive(child: child ?? Container())));
      },
    ),
  );
}
