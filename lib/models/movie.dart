import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie implements ItemCard{
  @override
  String id;
  String title;
  String director;
  String year;
  String note;
  String plot;
  String genre;

  Movie(
      {this.id = "",
      this.title = "",
      this.director = "",
      this.year = "",
      this.note = "",
      this.plot = "",
      this.genre = ""}){
    cardTitle = title;
    cardDescription = "$director";
  }

  @override
  bool isDone = false;

  @JsonKey(ignore: true)
  @override
  String tableName = 'movies';

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @JsonKey(ignore: true)
  @override
  String cardTitle;
}
