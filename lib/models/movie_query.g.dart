// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieQuery _$MovieQueryFromJson(Map<String, dynamic> json) => MovieQuery(
      page: json['page'] as int? ?? 1,
      query: json['query'] as String?,
    );

Map<String, dynamic> _$MovieQueryToJson(MovieQuery instance) =>
    <String, dynamic>{
      'page': instance.page,
      'query': instance.query,
    };
