class WallpaperModel {
  String photographer;
  String photographer_url;
  String photographer_id;
  SrcModel src;
  WallpaperModel(
      {this.src,
      this.photographer,
      this.photographer_id,
      this.photographer_url});

  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
        src: SrcModel.fromMap(jsonData["src"]),
        photographer: jsonData["photograper"],
        photographer_id: jsonData["photographer_id"],
        photographer_url: jsonData["photographer_url"]);
  }
}

class SrcModel {
  String original;
  String large2x;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;
  SrcModel({this.original, this.small, this.portrait});

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
        portrait: jsonData["portrait"],
        original: jsonData["original"],
        small: jsonData["small"]);
  }
}
