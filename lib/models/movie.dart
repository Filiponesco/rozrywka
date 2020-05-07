import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String id;
  String title;
  String director;
  String year;
  String note;
  String type;
  String plot;

  Movie(
      {this.id,
      this.title,
      this.director,
      this.year,
      this.note,
      this.type,
      this.plot});
}
