import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'game.g.dart';

@JsonSerializable()
class Game implements ItemCard {
  @override
  String id;
  String title;
  String forename;
  String surname;
  String publishedDate;
  String platforms;
  String publisher;
  String category;
  @override
  bool isDone;

  Game(
      {this.id = "",
      this.title,
      this.forename = "",
      this.surname = "",
      this.publishedDate = "",
      this.platforms = "",
      this.publisher = "",
      this.category = "",
      this.isDone = false}){
    cardTitle = title;
    cardDescription = "$forename $surname";
  }

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

  @JsonKey(ignore: true)
  @override
  String tableName = 'games';

  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @JsonKey(ignore: true)
  @override
  String cardTitle;
}
