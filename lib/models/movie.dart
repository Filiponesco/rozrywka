import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie implements ItemCard{
  @JsonKey(defaultValue: "")
  @override
  String id;
  @JsonKey(name: 'Title', defaultValue: "")
  String title;
  @JsonKey(name: 'Director', defaultValue: "")
  String director;
  @JsonKey(name: 'Year', defaultValue: "")
  String year;
  @JsonKey(name: 'Plot', defaultValue: "")
  String plot;
  @JsonKey(name: 'Genre', defaultValue: "")
  String genre;

  Movie(
      {this.id = "",
      this.title = "",
      this.director = "",
      this.year = "",
      this.plot = "",
      this.genre = ""}){
    cardTitle = title;
    cardDescription = "$director";
  }
  @JsonKey(defaultValue: false)
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