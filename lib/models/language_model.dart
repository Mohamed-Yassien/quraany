class LanguageModel {
  final int id;
  final String name;
  final String languageCode;

  LanguageModel({
    required this.name,
    required this.id,
    required this.languageCode,
  });

  static List<LanguageModel> languages = <LanguageModel>[
    LanguageModel(
      name: 'english',
      id: 1,
      languageCode: 'en',
    ),
    LanguageModel(
      name: 'العربية',
      id: 2,
      languageCode: 'ar',
    ),
  ];
}
