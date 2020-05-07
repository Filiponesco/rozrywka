import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable()
class Game {
  String id;
  String title;
  String forename;
  String surname;
  String publishedDate;
  String platforms;
  String publisher;
  String category;

  Game({this.id, this.title,
    this.forename, this.surname,
    this.publishedDate, this.platforms, this.publisher, this.category});
}