import 'package:ahdaf_task/core/theme/app_theme.dart';
import 'package:ahdaf_task/injectable/Injection.dart';
import 'package:ahdaf_task/presentation/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //auto login
  await configureDependencies(environment: 'prod');
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Consumer(
        builder: (context, watch, _) {
          Locale currentLocale = const Locale('ar');

          return MaterialApp(
            locale: currentLocale,
            debugShowCheckedModeBanner: false,
            initialRoute: HomeScreenView.routeName,
            routes: {
              HomeScreenView.routeName: (context) => HomeScreenView(),
            },
            theme: AppTheme.mainTheme,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'AE'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              return Directionality(
                textDirection: currentLocale.languageCode == 'ar'
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
