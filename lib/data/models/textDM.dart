import 'package:ahdaf_task/domain/entities/textEntity.dart';

class TextDM extends TextEntity {
  TextDM({super.ar, super.en});

  factory TextDM.fromJson(Map<String, dynamic> json) => TextDM(
        ar: json['ar'] as String?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };
}
