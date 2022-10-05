import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quraan_app/cubits/quraan_cubit/quran_cubit.dart';
import 'package:quraan_app/network/remote/dio_helper.dart';
import 'package:quraan_app/screens/welcome_screen.dart';

import 'network/local/cache_helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? userLocale;

  void setLocale(Locale locale) {
    setState(() {
      userLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranCubit()
            ..getQuranSurah(
              lang: CacheHelper.getData(key: 'lang') ?? 'en',
            ),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: Locale(CacheHelper.getData(key: 'lang') ?? 'en', ''),
        home: const WelcomeScreen(),
      ),
    );
  }
}
