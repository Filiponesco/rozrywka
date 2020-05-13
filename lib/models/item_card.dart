abstract class ItemCard{
  String id;
  String tableName;
  bool isDone;
  String cardTitle;
  String cardDescription;
  Map<String, dynamic> toJson();
}