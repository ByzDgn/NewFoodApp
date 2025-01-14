class Recipe {
  final String isim;
  final List<String> malzemeler;
  final List<String> yapilis;
  final String sure;
  final String servis;
  final String kalori;
  final String gorsel;

  Recipe({
    required this.isim,
    required this.malzemeler,
    required this.yapilis,
    required this.sure,
    required this.servis,
    required this.kalori,
    required this.gorsel,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      isim: json['isim'],
      malzemeler: List<String>.from(json['malzemeler']),
      yapilis: List<String>.from(json['yapilis']),
      sure: json['sure'],
      servis: json['servis'],
      kalori: json['kalori'],
      gorsel: json['gorsel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'malzemeler': malzemeler,
      'yapilis': yapilis,
      'sure': sure,
      'servis': servis,
      'kalori': kalori,
      'gorsel': gorsel,
    };
  }
}
