import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class Genre {
  int id;
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  int id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  String name;
  @JsonKey(name: 'origin_country')
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  String name;

  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: 'english_name')
  String englishName;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);
  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}

@JsonSerializable()
class Video {
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  @JsonKey(name: 'iso_3166_1')
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  @JsonKey(name: 'official')
  bool official;
  @JsonKey(name: 'published_at')
  String publishedAt;
  String id;

  Video({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

@JsonSerializable()
class Videos {
  List<Video> results;

  Videos({required this.results});

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);
  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: 'aspect_ratio')
  double aspectRatio;
  int height;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  @JsonKey(name: 'file_path')
  String filePath;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  int width;

  Image({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}

@JsonSerializable()
class Images {
  @JsonKey(name: 'backdrops')
  List<Image> backdrops;
  @JsonKey(name: 'logos')
  List<Image> logos;
  @JsonKey(name: 'posters')
  List<Image> posters;

  Images({
    required this.backdrops,
    required this.logos,
    required this.posters,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

@JsonSerializable()
class MovieDetails {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  String releaseDate;
  int revenue;
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  Videos videos;
  Images images;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.videos,
    required this.images,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
