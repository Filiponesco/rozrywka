import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie implements ItemCard {
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

  @JsonKey(defaultValue: false)
  @override
  bool isDone = false;

  @JsonKey(ignore: true)
  @override
  String tableName = 'movies';

  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @JsonKey(ignore: true)
  @override
  String cardTitle;

  Movie({this.title, this.director}) {
    cardTitle = title;
    cardDescription = "$director";
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @JsonKey(ignore: true)
  @override
  String titleAddItem = 'Dodaj film';

  @override
  Map<String, String> jsonToPL() {
    return <String, String>{
      'id': 'id',
      'Title': 'Tytuł',
      'Director': 'Reżyser',
      'Year': 'Rok',
      'Plot': 'Opis',
      'Genre': 'Gatunek',
      'isDone': 'Obejrzany',
    };
  }

  @override
  String titleEditItem = 'Edytuj film';

  @override
  IconData icon = Icons.movie;
}
