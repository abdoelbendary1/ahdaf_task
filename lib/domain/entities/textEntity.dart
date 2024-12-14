class TextEntity {
  String? ar;
  String? en;

  TextEntity({
    this.ar,
    this.en,
  });

  factory TextEntity.fromJson(Map<String, dynamic> json) => TextEntity(
        ar: json['ar'] as String?,
        en: json['en'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };
}
