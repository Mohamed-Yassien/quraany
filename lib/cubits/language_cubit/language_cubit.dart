import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quraan_app/cubits/language_cubit/language_states.dart';

class LanguageCubit extends Cubit<LanguageStates>{

  LanguageCubit() : super(LanguageInitialState());

  static LanguageCubit get(context) => BlocProvider.of(context);

  changeLanguage(){

  }
}