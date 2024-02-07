import 'package:json_annotation/json_annotation.dart';

part 'movie_query.g.dart';

@JsonSerializable()
class MovieQuery {
  final int page;
  final String? query;

  MovieQuery({
    this.page = 1,
    this.query,
  });

  factory MovieQuery.fromJson(Map<String, dynamic> json) =>
      _$MovieQueryFromJson(json);

  Map<String, dynamic> toJson() => _$MovieQueryToJson(this);
}
