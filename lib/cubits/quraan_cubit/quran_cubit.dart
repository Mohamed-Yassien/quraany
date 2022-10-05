import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/cubits/quraan_cubit/quraan_states.dart';
import 'package:quraan_app/models/quran_surah_model.dart';
import 'package:quraan_app/network/endpoints.dart';
import 'package:quraan_app/network/remote/dio_helper.dart';

class QuranCubit extends Cubit<QuranStates> {
  QuranCubit() : super(QuranInitialState());

  static QuranCubit get(context) => BlocProvider.of(context);

  QuranSurahModel? quranSurahModel;
  List<String>? data;

  void getQuranSurah({
    required String lang,
  }) async {
    emit(GetQuranLoadingState());
    List<String> dd = [];
    DioHelper.getData(url: GET_QURAN_SURAH(lang)).then((value) {
      quranSurahModel = QuranSurahModel.fromJson(value.data);
      for (var element in quranSurahModel!.data!.ayahs!) {
        dd.add(element.text!);
      }
      data = dd;
      print('data is $data');
      print(quranSurahModel!.data!.ayahs![0].text);
      emit(GetQuranSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetQuranErrorState());
    });
  }
}
