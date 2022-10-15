import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/cubits/quraan_cubit/quraan_states.dart';
import 'package:quraan_app/cubits/quraan_cubit/quran_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          context.read<QuranCubit>().quranSurahModel!.data!.name!,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<QuranCubit, QuranStates>(
          builder: (context, state) {
            var cubit = QuranCubit.get(context);

            if (state is GetQuranLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return cubit.data == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(
                          // cubit.quranSurahModel!.data!.ayahs![index].text!,
                          cubit.data!.join(' 🤲 '),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        );
                      },
                      itemCount: cubit.data!.length,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
