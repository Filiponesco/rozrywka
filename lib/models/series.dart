import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';
part 'series.g.dart';
@JsonSerializable()
class Series implements ItemCard{

  @JsonKey(defaultValue: "")
  @override
  String id;

  @JsonKey(defaultValue: "")
  String title;

  @JsonKey(defaultValue: "")
  String years;

  @JsonKey(defaultValue: "")
  String releasedYear;

  @JsonKey(defaultValue: "")
  String genre;

  @JsonKey(defaultValue: "")
  String plot;

  @JsonKey(defaultValue: "")
  String director;

  @JsonKey(defaultValue: "")
  String note;

  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @JsonKey(ignore: true)
  @override
  String cardTitle;

  @override
  bool isDone = false;

  @JsonKey(ignore: true)
  @override
  String tableName = 'series';

  Series({this.title, this.director}){
    cardTitle = title;
    cardDescription = "$director";
  }

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SeriesToJson(this);

  @JsonKey(ignore: true)
  @override
  String titleAddItem = 'Dodaj serial';

  @override
  Map<String, String> jsonToPL() {
    return <String, String>{
      'id': 'id',
      'title': 'Tytuł',
      'years': 'Lata',
      'releasedYear': 'Rok wydania',
      'genre': 'Gatunek',
      'plot': 'Opis',
      'director': 'Reżyser',
      'note': 'Ocena',
      'isDone': 'Obejrzany',
    };
  }

  @override
  String titleEditItem = 'Edytuj serial';

}