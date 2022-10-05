import 'package:flutter/material.dart';
import 'package:quraan_app/screens/home_screen.dart';
import 'package:quraan_app/widgets/language_change_drop.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
