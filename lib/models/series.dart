import 'package:json_annotation/json_annotation.dart';
import 'package:rozrywka/models/item_card.dart';
part 'series.g.dart';
@JsonSerializable()
class Series implements ItemCard{
  String title;
  String years;
  String releasedYear;
  String genre;
  String plot;
  String director;
  String note;
  Series({this.id = "", this.title="", this.years="",
  this.releasedYear="", this.genre="", this.plot="",
  this.director="", this.isDone = false}){
    cardTitle = title;
    cardDescription = "$director";
  }

  @JsonKey(ignore: true)
  @override
  String cardDescription;

  @JsonKey(ignore: true)
  @override
  String cardTitle;

  @override
  String id;

  @override
  bool isDone;

  @JsonKey(ignore: true)
  @override
  String tableName = 'series';

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SeriesToJson(this);

}