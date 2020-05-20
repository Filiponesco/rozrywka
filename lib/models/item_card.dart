abstract class ItemCard{
  String id;
  String tableName;
  bool isDone;
  String cardTitle;
  String cardDescription;
  Map<String, dynamic> toJson();

  String titleAddItem;
  Map<String, String> jsonToPL();
  String titleEditItem;
}