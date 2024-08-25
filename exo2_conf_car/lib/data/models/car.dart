class Car {
  String name;
  String url;
  int places;
  bool isElectric;

  Car(
      {required this.name,
      required this.url,
      required this.places,
      required this.isElectric});

  String get urlString => "assets/$url.jpg";
}
