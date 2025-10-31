import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String originalLanguage;
  @HiveField(2)
  final String originalTitle;
  @HiveField(3)
  final String overview;
  @HiveField(4)
  final double popularity;
  @HiveField(5)
  final String posterPath;
  @HiveField(6)
  final String releaseDate;
  @HiveField(7)
  final String title;
  @HiveField(8)
  final bool video;
  @HiveField(9)
  final double voteAverage;
  @HiveField(10)
  final int voteCount;

  MovieModel({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );
  }
}
