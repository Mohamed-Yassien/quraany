import 'package:flutter/material.dart';
import 'package:quraan_app/screens/home_screen.dart';
import 'package:quraan_app/widgets/language_change_drop.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../main.dart';
import '../models/language_model.dart';
import '../network/local/cache_helper.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int groupValue = 0;

  List<String> langs = [
    'English',
    'العربية',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageChangeDrop(
              fillColor: Colors.teal,
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: List.generate(
                LanguageModel.languages.length,
                (index) => RadioListTile<int>(
                  title:  Text(langs[index]),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: index,
                  groupValue: groupValue,
                  onChanged: (val){
                    if (val != null) {
                      setState((){
                        groupValue = val;
                      });
                      switch (val){
                        case 0:
                          CacheHelper.saveData(key: 'lang', value:'en').then(
                                (value) {
                              MyApp.setLocale(
                                context,
                                Locale(CacheHelper.getData(key: 'lang'), ''),
                              );
                            },
                          );
                          break;
                        case 1:
                          CacheHelper.saveData(key: 'lang', value:'ar').then(
                                (value) {
                              MyApp.setLocale(
                                context,
                                Locale(CacheHelper.getData(key: 'lang'), ''),
                              );
                            },
                          );
                      }
                      print(val);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              color: Colors.teal,
              child: Text(
                AppLocalizations.of(context)!.cont,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
