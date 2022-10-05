import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/cubits/quraan_cubit/quraan_states.dart';
import 'package:quraan_app/cubits/quraan_cubit/quran_cubit.dart';
import 'package:quraan_app/widgets/language_change_drop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          LanguageChangeDrop(),
        ],
      ),
      body: BlocBuilder<QuranCubit, QuranStates>(
        builder: (context, state) {
          var cubit = QuranCubit.get(context);

          if (state is GetQuranLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return cubit.quranSurahModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scrollbar(
            thumbVisibility: true,
                trackVisibility: true,
                interactive: true,
                thickness: 15.0,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          cubit.quranSurahModel!.data!.ayahs![index].text!,
                          textAlign: TextAlign.justify,
                        );
                      },
                      itemCount: cubit.quranSurahModel!.data!.ayahs!.length,
                    ),
                  ),
              );
        },
      ),
    );
  }
}
