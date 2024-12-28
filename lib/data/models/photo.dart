class Photo {
  final String src;
  final String photographer;
  final String alt;

  Photo({
    required this.src,
    required this.photographer,
    required this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      src: json['src']['medium'],
      photographer: json['photographer'],
      alt: json['alt'],
    );
  }
}
