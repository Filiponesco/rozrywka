import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';

part 'game.g.dart';

@JsonSerializable()
class Game implements ItemCard {
  @JsonKey(defaultValue: "")
  @override
  String id;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String forename;

  @JsonKey(defaultValue: "")
  String surname;

  @JsonKey(defaultValue: "")
  String publishedDate;

  @JsonKey(defaultValue: "")
  String platforms;

  @JsonKey(defaultValue: "")
  String publisher;

  @JsonKey(defaultValue: "")
  String category;

  @JsonKey(defaultValue: false)
  @override
  bool isDone = false;

  @JsonKey(ignore: true)
  @override
  String tableName = 'games';

  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @JsonKey(ignore: true)
  @override
  String cardTitle;

  Game({this.title, this.forename, this.surname}){
    cardTitle = title;
    cardDescription = "$forename $surname";
  }

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

  @JsonKey(ignore: true)
  @override
  String titleAddItem = 'Dodaj grę';

  @override
  Map<String, String> jsonToPL() {
    return <String, String>{
      'id': 'id',
      'title': 'Tytuł',
      'forename': 'Imię',
      'surname': 'Nazwisko',
      'publishedDate': 'Data publikacji',
      'platforms': 'Platformy',
      'publisher': 'Wydawca',
      'category': 'Kategoria',
      'isDone': 'Zagrana',
    };
  }

  @override
  String titleEditItem = 'Edytuj grę';
}
